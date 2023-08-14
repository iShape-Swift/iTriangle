//
//  Delaunay.swift
//  
//
//  Created by Nail Sharipov on 08.06.2023.
//

import iFixFloat
import iShape

private struct IntList {
    
    private var buffer: UnsafeMutablePointer<Int>
    private var capacity: Int
    private (set) var count: Int

    subscript(index: Int) -> Int {
        buffer[index]
    }
    
    init(capacity: Int) {
        buffer = UnsafeMutablePointer<Int>.allocate(capacity: capacity)
        self.capacity = capacity
        self.count = 0
    }
    
    init(array: [Int]) {
        capacity = array.count
        count = capacity
        buffer = UnsafeMutablePointer<Int>.allocate(capacity: count)
        buffer.initialize(from: array, count: count)
    }

    mutating func append(_ value: Int) {
        if count == capacity {
            let newCapacity = 2 * (capacity + 1)
            let newBuffer = UnsafeMutablePointer<Int>.allocate(capacity: newCapacity)
            newBuffer.initialize(from: buffer, count: capacity)
            buffer.deallocate()
            capacity = newCapacity
            buffer = newBuffer
        }
        buffer[count] = value
        count &+= 1
    }

    mutating func removeAll() {
        count = 0
    }
    
    func deallocate() {
        buffer.deallocate()
    }
}

public struct Delaunay {

    public internal (set) var points: [FixVec]
    
    var triangles: [DTriangle]

    init(points: [FixVec], triangles: [DTriangle]) {
        self.points = points
        self.triangles = triangles
    }
    
    mutating func build() {
        triangles.withUnsafeMutableBufferPointer { pointer in
            let count = pointer.count
            
            let visitMarks = UnsafeMutablePointer<Bool>.allocate(capacity: count)
            visitMarks.initialize(repeating: false, count: count)
            var visitIndex = 0

            var origin = IntList(capacity: 64)
            origin.append(0)
            
            var buffer = IntList(capacity: 64)

            while origin.count > 0 {
                var j = 0
                while j < origin.count {
                    let i = origin[j]
                    j &+= 1
                    var triangle = pointer[i]
                    visitMarks[i] = true
                    for k in 0...2 {
                        let neighborIndex = triangle.neighbors[k]
                        guard neighborIndex >= 0 else { continue }
                        
                        var neighbor = pointer[neighborIndex]
                        if Self.swap(abc: triangle, pbc: neighbor, triangles: pointer) {
                            triangle = pointer[triangle.index]
                            neighbor = pointer[neighbor.index]
                            
                            let tna = triangle.neighbors.a
                            if tna >= 0 && tna != neighbor.index {
                                buffer.append(tna)
                            }
                            
                            let tnb = triangle.neighbors.b
                            if tnb >= 0 && tnb != neighbor.index {
                                buffer.append(tnb)
                            }
                            
                            let tnc = triangle.neighbors.c
                            if tnc >= 0 && tnc != neighbor.index {
                                buffer.append(tnc)
                            }
                            
                            let nna = neighbor.neighbors.a
                            if nna >= 0 && nna != triangle.index {
                                buffer.append(nna)
                            }
                            
                            let nnb = neighbor.neighbors.b
                            if nnb >= 0 && nnb != triangle.index {
                                buffer.append(nnb)
                            }
                            
                            let nnc = neighbor.neighbors.c
                            if nnc >= 0 && nnc != triangle.index {
                                buffer.append(nnc)
                            }
                        }
                    }
                }
                if buffer.count == 0 && visitIndex < count {
                    visitIndex &+= 1
                    while visitIndex < count {
                        if visitMarks[visitIndex] == false {
                            buffer.append(visitIndex)
                            break
                        }
                        visitIndex &+= 1
                    }
                }
                let temp = origin
                origin = buffer
                buffer = temp
                buffer.removeAll()
            }
            
            origin.deallocate()
            buffer.deallocate()
            visitMarks.deallocate()
        }
    }
    
    mutating func fix(indices: [Int], indexBuffer: inout IndexBuffer) {
        triangles.withUnsafeMutableBufferPointer { pointer in
            var origin = IntList(array: indices)
            var buffer = IntList(capacity: 64)

            while origin.count > 0 {
                var j = 0
                while j < origin.count {
                    let i = origin[j]
                    j &+= 1
                    var triangle = pointer[i]
                    for k in 0...2 {
                        let neighborIndex = triangle.neighbors[k]
                        if neighborIndex >= 0 {
                            var neighbor = pointer[neighborIndex]
                            if Self.swap(abc: triangle, pbc: neighbor, triangles: pointer) {
                                indexBuffer.add(index: triangle.index)
                                indexBuffer.add(index: neighbor.index)
                                
                                triangle = pointer[triangle.index]
                                neighbor = pointer[neighbor.index]

                                let tna = triangle.neighbors.a
                                if tna >= 0 && tna != neighbor.index {
                                    buffer.append(tna)
                                }
                                
                                let tnb = triangle.neighbors.b
                                if tnb >= 0 && tnb != neighbor.index {
                                    buffer.append(tnb)
                                }
                                
                                let tnc = triangle.neighbors.c
                                if tnc >= 0 && tnc != neighbor.index {
                                    buffer.append(tnc)
                                }
                                
                                let nna = neighbor.neighbors.a
                                if nna >= 0 && nna != triangle.index {
                                    buffer.append(nna)
                                }
                                
                                let nnb = neighbor.neighbors.b
                                if nnb >= 0 && nnb != triangle.index {
                                    buffer.append(nnb)
                                }
                                
                                let nnc = neighbor.neighbors.c
                                if nnc >= 0 && nnc != triangle.index {
                                    buffer.append(nnc)
                                }
                            }
                        }
                    }
                }
                let temp = origin
                origin = buffer
                buffer = temp
                buffer.removeAll()
            }
            
            origin.deallocate()
            buffer.deallocate()
        }
    }

    private static func swap(abc: DTriangle, pbc: DTriangle, triangles: UnsafeMutableBufferPointer<DTriangle>) -> Bool {
        let pi = pbc.opposite(neighbor: abc.index)
        let p = pbc.vertices[pi]
        
        let ai: Int
        let bi: Int
        let ci: Int
        let a: DVertex  // opposite a-p
        let b: DVertex  // edge bc
        let c: DVertex
        
        ai = abc.opposite(neighbor: pbc.index)
        switch ai {
        case 0:
            bi = 1
            ci = 2
            a = abc.vertices.a
            b = abc.vertices.b
            c = abc.vertices.c
        case 1:
            bi = 2
            ci = 0
            a = abc.vertices.b
            b = abc.vertices.c
            c = abc.vertices.a
        default:
            bi = 0
            ci = 1
            a = abc.vertices.c
            b = abc.vertices.a
            c = abc.vertices.b
        }
        
        let isPrefect = Delaunay.isDelaunay(p0: p.point, p1: c.point, p2: a.point, p3: b.point)

        if isPrefect {
            return false
        } else {
            
            let isABP_CW = Triangle.isClockwise(p0: a.point, p1: b.point, p2: p.point)
            
            let bp = pbc.neighbor(vertex: c.index)
            let cp = pbc.neighbor(vertex: b.index)
            let ab = abc.neighbors[ci]
            let ac = abc.neighbors[bi]

            // abc -> abp
            var abp: DTriangle
            
            // pbc -> acp
            var acp: DTriangle

            if isABP_CW {
                abp = DTriangle(
                    index: abc.index,
                    a: a,
                    b: b,
                    c: p,
                    bc: bp,                     // a - bp
                    ac: pbc.index,              // p - ap
                    ab: ab                      // b - ab
                )

                acp = DTriangle(
                    index: pbc.index,
                    a: a,
                    b: p,
                    c: c,
                    bc: cp,                     // a - cp
                    ac: ac,                     // p - ac
                    ab: abc.index               // b - ap
                )
            } else {
                abp = DTriangle(
                    index: abc.index,
                    a: a,
                    b: p,
                    c: b,
                    bc: bp,                     // a - bp
                    ac: ab,                     // p - ab
                    ab: pbc.index               // b - ap
                )

                acp = DTriangle(
                    index: pbc.index,
                    a: a,
                    b: c,
                    c: p,
                    bc: cp,                     // a - cp
                    ac: abc.index,              // p - ap
                    ab: ac                      // b - ac
                )
            }
            
            // fix neighbor's link
            // ab, cp did't change neighbor
            // bc -> ap, so no changes
            
            // ac (abc) is now edge of acp
            let acIndex = abc.neighbors[bi] // b - angle
            if acIndex >= 0 {
                var neighbor = triangles[acIndex]
                neighbor.updateOpposite(oldNeighbor: abc.index, newNeighbor: acp.index)
                triangles[acIndex] = neighbor
            }

            // bp (pbc) is now edge of abp
            let bpIndex = pbc.neighbor(vertex: c.index) // c - angle
            if bpIndex >= 0 {
                var neighbor = triangles[bpIndex]
                neighbor.updateOpposite(oldNeighbor: pbc.index, newNeighbor: abp.index)
                triangles[bpIndex] = neighbor
            }
            
            triangles[abc.index] = abp
            triangles[pbc.index] = acp
            
            return true
        }
    }

    static func isDelaunay(p0: FixVec, p1: FixVec, p2: FixVec, p3: FixVec) -> Bool {

        let x01 = p0.x - p1.x
        let x03 = p0.x - p3.x
        let x12 = p1.x - p2.x
        let x32 = p3.x - p2.x
        
        let y01 = p0.y - p1.y
        let y03 = p0.y - p3.y
        let y12 = p1.y - p2.y
        let y23 = p2.y - p3.y
        
        let cosA = x01 * x03 + y01 * y03
        let cosB = x12 * x32 - y12 * y23
        
        if cosA < 0 && cosB < 0 {
            return false
        }
        
        if cosA >= 0 && cosB >= 0 {
            return true
        }
        
        // we can not just compare
        // sinA * cosB + cosA * sinB ? 0
        // cause we need weak Delaunay condition
        
        let sinA = x01 * y03 - x03 * y01
        let sinB = x12 * y23 + x32 * y12

        let sl01 = x01 * x01 + y01 * y01
        let sl03 = x03 * x03 + y03 * y03
        let sl12 = x12 * x12 + y12 * y12
        let sl23 = x32 * x32 + y23 * y23
        
        // TODO use fix float
        
        let max0 = Double(sl01 > sl03 ? sl01 : sl03)
        let max1 = Double(sl12 > sl23 ? sl12 : sl23)
        
        
        let dSinA = Double(sinA)
        let dCosA = Double(cosA)
        let dSinB = Double(sinB)
        let dCosB = Double(cosB)

        let sinAB = (dSinA * dCosB + dCosA * dSinB) / (max0 * max1)

        return sinAB < 0.001
    }

    public var trianglesIndices: [Int] {
        var result = Array<Int>(repeating: -1, count: 3 * triangles.count)
        var j = 0
        for triangle in triangles {
            result[j] = triangle.vertices.a.index
            result[j + 1] = triangle.vertices.b.index
            result[j + 2] = triangle.vertices.c.index
            j += 3
        }
        
        return result
    }
    
    public func trianglesIndices(shifted: Int) -> [Int] {
        var result = Array<Int>(repeating: -1, count: 3 * triangles.count)
        var j = 0
        for triangle in triangles {
            result[j] = triangle.vertices.a.index + shifted
            result[j + 1] = triangle.vertices.b.index + shifted
            result[j + 2] = triangle.vertices.c.index + shifted
            j += 3
        }
        
        return result
    }
    
}
