//
//  FixShape+nLayout.swift
//  
//
//  Created by Nail Sharipov on 01.06.2023.
//

import iFixFloat
import iShape

@usableFromInline
enum MNodeType: Int {
    case end
    case start
    case merge
    case split
}

@usableFromInline
struct MSpecialNode {
    
    @usableFromInline
    static let empty = MSpecialNode(index: .empty, type: .start, sort: .zero)
    
    @usableFromInline
    let type: MNodeType
    
    @usableFromInline
    let index: Int

    @usableFromInline
    let sort: FixFloat
    
    @inlinable
    init(index: Int, type: MNodeType, sort: FixFloat) {
        self.index = index
        self.type = type
        self.sort = sort
    }
}

@usableFromInline
struct NodeLayout {
    
    @usableFromInline
    let navNodes: [MNavNode]
    
    @usableFromInline
    let specNodes: [MSpecialNode]
    
    @inlinable
    init(verts: [MNavNode], nodes: [MSpecialNode]) {
        self.navNodes = verts
        self.specNodes = nodes
    }
}

extension FlipShape {
    
    @inlinable
    var nLayout: NodeLayout {
        var n = 0
        for path in paths {
            n += path.count
        }
        
        var verts = [MNavNode](repeating: .empty, count: n)
        var nodes = [MSpecialNode]()
        
        var s = 0
        for j in 0..<paths.count {
            
            let path = paths[j]
            
            var i0 = path.count - 2

            var p0 = path[i0]

            var i1 = i0 + 1
            
            var p1 = path[i1]
            
            for i2 in 0..<path.count {

                let i = i1 + s
                
                let p2 = path[i2]

                let b0 = p0.bitPack
                let b1 = p1.bitPack
                let b2 = p2.bitPack

                let c0 = b0 > b1 && b1 < b2
                let c1 = b0 < b1 && b1 > b2
                
                if c0 || c1 {
                    let isCW = Triangle.isClockwise(p0: p0, p1: p1, p2: p2)
                    let type: MNodeType = c0 ? (isCW ? .start : .split) : (isCW ? .end : .merge)
                    nodes.append(MSpecialNode(index: i, type: type, sort: b1))
                }

                verts[i] = MNavNode(next: i2 + s, index: i, prev: i0 + s, vert: DVertex(index: i, point: p1, type: .origin))
                
                i0 = i1
                i1 = i2
                
                p0 = p1
                p1 = p2
            }
            
            s += path.count
        }
        
        nodes.sort(by: {
            if $0.sort != $1.sort {
                return $0.sort < $1.sort
            } else {
                return $0.type.rawValue < $1.type.rawValue
            }
        })
        
        return NodeLayout(verts: verts, nodes: nodes)
    }
}
