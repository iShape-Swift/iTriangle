//
//  MVert.swift
//  
//
//  Created by Nail Sharipov on 01.06.2023.
//

import iFixFloat

@usableFromInline
struct MNavNode {
    
    @usableFromInline
    static let empty = MNavNode(next: .empty, index: .empty, prev: .empty, vert: .empty)
    
    @usableFromInline
    var next: Int
    
    @usableFromInline
    let index: Int
    
    @usableFromInline
    var prev: Int
    
    @usableFromInline
    let vert: DVertex
 
    @inlinable
    init(next: Int, index: Int, prev: Int, vert: DVertex) {
        self.next = next
        self.index = index
        self.prev = prev
        self.vert = vert
    }
    
}

@usableFromInline
struct ABVert {
    
    @usableFromInline
    let a: MNavNode
    
    @usableFromInline
    let b: MNavNode
    
    @inlinable
    var slice: MSlice { MSlice(a: a.vert.index, b: b.vert.index) }
    
    @inlinable
    init(a: MNavNode, b: MNavNode) {
        self.a = a
        self.b = b
    }
}

extension Array where Element == MNavNode {
    
    @inlinable
    mutating func newNext(a: Int, b: Int) -> ABVert {
        var aVert = self[a]
        var bVert = self[b]

        let count = self.count

        // add new verts
        
        let newA = MNavNode(
            next: count + 1,
            index: count,
            prev: aVert.prev,
            vert: aVert.vert
        )
        self.append(newA)
        
        self[aVert.prev].next = count

        let newB = MNavNode(
            next: bVert.next,
            index: count + 1,
            prev: count,
            vert: bVert.vert
        )

        self.append(newB)
        self[bVert.next].prev = count + 1
        
        // update old verts
        
        aVert.prev = b
        bVert.next = a
        
        self[a] = aVert
        self[b] = bVert
        
        return ABVert(a: newA, b: newB)
    }
    
    @inlinable
    func isIntersectNextReverse(p0: FixVec, p1: FixVec, start: Int) -> Bool {
        var n = self[start]
        let stop = p0.x
        let v = p1 - p0
        while n.vert.point.x <= stop {
            let s = v.crossProduct(n.vert.point - p0)
            if s >= 0 {
                return true
            }
            n = self[n.prev]
        }
        
        return false
    }

    @inlinable
    func isIntersectPrevReverse(p0: FixVec, p1: FixVec, start: Int) -> Bool {
        var n = self[start]
        let stop = p0.x
        let v = p1 - p0
        while n.vert.point.x > stop {
            let s = v.crossProduct(n.vert.point - p0)
            if s >= 0 {
                return true
            }
            n = self[n.next]
        }
        
        return false
    }
    
    @inlinable
    func isIntersect(p0: FixVec, p1: FixVec, next: Int, prev: Int) -> Bool {
        let isNext = isIntersectNextReverse(p0: p0, p1: p1, start: next)
        let isPrev = isIntersectPrevReverse(p0: p0, p1: p1, start: prev)
        
        return isNext || isPrev
    }
    
#if DEBUG
    
    @inlinable
    func findStart(index: Int) -> Int {
        let this = self[index]
        var next = self[this.next]
        var prev = self[this.prev]
        
        var bit = this.vert.point.bitPack
        var aBit = next.vert.point.bitPack
        var bBit = prev.vert.point.bitPack
        
        if aBit < bit {
            repeat {
                next = self[next.next]
                bit = aBit
                aBit = next.vert.point.bitPack
            } while aBit < bit
            return next.prev
        } else if bBit < bit {
            repeat {
                prev = self[prev.prev]
                bit = bBit
                bBit = prev.vert.point.bitPack
            } while bBit < bit
            return prev.next
        } else {
            return index
        }
    }
    
    @inlinable
    func isEmpty(start: Int) -> Bool {
        var next = self[start]
        var p0 = next.vert.point
        
        var unsafeArea: FixFloat = 0

        repeat {
            next = self[next.next]
            let p1 = next.vert.point
           
            unsafeArea += p0.unsafeCrossProduct(p1)

            p0 = p1
        } while next.index != start

        if unsafeArea > 0 {
            print(unsafeArea)
        }
        
        return unsafeArea == 0
    }
#endif
}
