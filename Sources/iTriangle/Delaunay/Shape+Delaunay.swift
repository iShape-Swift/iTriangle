//
//  Shape+Delaunay.swift
//  
//
//  Created by Nail Sharipov on 08.06.2023.
//

import iFixFloat
import iShape

public extension Shape {
    
    private struct Edge {
        let a: Int            // vertex index
        let b: Int            // vertex index
        let neighbor: Int     // prev triangle index
    }

    private struct TriangleStack {
        
        private var edges: [Edge]
        private var triangles: [DTriangle]
        private var counter: Int
        
        init(count: Int) {
            self.counter = 0
            self.edges = Array<Edge>()
            self.edges.reserveCapacity(8)
            self.triangles = Array<DTriangle>(repeating: .init(), count: count)
        }
        
        mutating func getTriangles() -> [DTriangle] {
            if counter != triangles.count {
                self.triangles.removeLast(triangles.count - counter)
            }
            return self.triangles
        }
        
        mutating func reset() {
            self.edges.removeAll(keepingCapacity: true)
        }
        
        mutating func add(a: DVertex, b: DVertex, c: DVertex) {
            guard a.index != b.index && a.index != c.index && b.index != c.index else {
                // ignore triangle with tween vertices
                return
            }
            
            var triangle = DTriangle(
                index: counter,
                a: a,
                b: b,
                c: c
            )
            
            if let ac = self.pop(a: a.index, b: c.index) {
                var neighbor = triangles[ac.neighbor]
                neighbor.neighbors.a = triangle.index
                triangle.neighbors.b = neighbor.index
                self.triangles[neighbor.index] = neighbor
            }
            
            if let ab = self.pop(a: a.index, b: b.index) {
                var neighbor = triangles[ab.neighbor]
                neighbor.neighbors.a = triangle.index
                triangle.neighbors.c = neighbor.index
                self.triangles[neighbor.index] = neighbor
            }
            
            self.edges.append(Edge(a: b.index, b: c.index, neighbor: triangle.index)) // bc is always slice
            
            self.triangles[triangle.index] = triangle
            
            self.counter += 1
        }
        
        private mutating func pop(a: Int, b: Int) -> Edge? {
            let last = self.edges.count - 1
            var i = 0
            while i <= last {
                let e = self.edges[i]
                if (e.a == a || e.a == b) && (e.b == a || e.b == b) {
                    if i != last {
                        self.edges[i] = self.edges[last]
                    }
                    self.edges.removeLast()
                    return e
                }
                i += 1
            }
            return nil
        }
    }

    func delaunay() -> Delaunay? {
        let layout = self.mLayout
        
        guard layout.status == .success else {
            return nil
        }
            
        let holesCount = self.count - 1
        let vertCount = self.reduce(0, { $0 + $1.count })
        let totalCount = vertCount + holesCount * 2
        
        var triangleStack = TriangleStack(count: totalCount)
        
        var links = layout.navNodes
        for index in layout.startList {
            Self.triangulate(index: index, links: &links, triangleStack: &triangleStack)
            triangleStack.reset()
        }
        
        var triangles = triangleStack.getTriangles()
        
        var sliceBuffer = MSliceBuffer(vertexCount: links.count, slices: layout.sliceList)
        sliceBuffer.addConections(triangles: &triangles)

        var delaunay = Delaunay(triangles: triangles)

        delaunay.build()
        
        return delaunay
    }
    
    private static func triangulate(index: Int, links: inout [MNavNode], triangleStack: inout TriangleStack) {
        var c = links[index]
        
        var a0 = links[c.next]
        var b0 = links[c.prev]
        
        while a0.index != b0.index {
            let a1 = links[a0.next]
            let b1 = links[b0.prev]
            
            var aBit0 = a0.vert.point.bitPack
            var aBit1 = a1.vert.point.bitPack
            if aBit1 < aBit0 {
                aBit1 = aBit0
            }
            
            var bBit0 = b0.vert.point.bitPack
            var bBit1 = b1.vert.point.bitPack
            if bBit1 < bBit0 {
                bBit1 = bBit0
            }
            
            if aBit0 <= bBit1 && bBit0 <= aBit1 {
                triangleStack.add(a: c.vert, b: a0.vert, c: b0.vert)
                
                a0.prev = b0.index
                b0.next = a0.index
                links[a0.index] = a0
                links[b0.index] = b0
                
                if bBit0 < aBit0 {
                    c = b0
                    b0 = b1
                } else {
                    c = a0
                    a0 = a1
                }
            } else {
                if aBit1 < bBit1 {
                    var cx = c
                    var ax0 = a0
                    var ax1 = a1
                    var ax1Bit: UInt64 = .min
                    repeat {
                        let isCW_or_Line = Triangle.isCW_or_Line(p0: cx.vert.point, p1: ax0.vert.point, p2: ax1.vert.point)
                        
                        if isCW_or_Line {
                            triangleStack.add(a: ax0.vert, b: ax1.vert, c: cx.vert)
                            
                            ax1.prev = cx.index
                            cx.next = ax1.index
                            links[cx.index] = cx
                            links[ax1.index] = ax1
                            
                            if cx.index != c.index {
                                // move back
                                ax0 = cx
                                cx = links[cx.prev]
                            } else {
                                // move forward
                                ax0 = ax1
                                ax1 = links[ax1.next]
                            }
                        } else {
                            cx = ax0
                            ax0 = ax1
                            ax1 = links[ax1.next]
                        }
                        ax1Bit = ax1.vert.point.bitPack
                    } while ax1Bit < bBit0
                } else {
                    var cx = c
                    var bx0 = b0
                    var bx1 = b1
                    var bx1Bit: UInt64 = .min
                    repeat {
                        let isCW_or_Line = Triangle.isCW_or_Line(p0: cx.vert.point, p1: bx1.vert.point, p2: bx0.vert.point)
                        if isCW_or_Line {
                            triangleStack.add(a: bx0.vert, b: cx.vert, c: bx1.vert)
                            
                            bx1.next = cx.index
                            cx.prev = bx1.index
                            links[cx.index] = cx
                            links[bx1.index] = bx1
                            
                            if cx.index != c.index {
                                // move back
                                bx0 = cx
                                cx = links[cx.next]
                            } else {
                                // move forward
                                bx0 = bx1
                                bx1 = links[bx0.prev]
                            }
                        } else {
                            cx = bx0
                            bx0 = bx1
                            bx1 = links[bx1.prev]
                        }
                        bx1Bit = bx1.vert.point.bitPack
                    } while bx1Bit < aBit0
                }
                
                c = links[c.index]
                a0 = links[c.next]
                b0 = links[c.prev]
                
                aBit0 = a0.vert.point.bitPack
                bBit0 = b0.vert.point.bitPack
                
                triangleStack.add(a: c.vert, b: a0.vert, c: b0.vert)
                
                a0.prev = b0.index
                b0.next = a0.index
                links[a0.index] = a0
                links[b0.index] = b0
                
                if bBit0 < aBit0 {
                    c = b0
                    b0 = links[b0.prev]
                } else {
                    c = a0
                    a0 = links[a0.next]
                }
                
            } //while
        }
    }
}
