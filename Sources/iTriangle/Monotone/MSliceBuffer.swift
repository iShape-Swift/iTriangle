//
//  MSliceBuffer.swift
//  
//
//  Created by Nail Sharipov on 08.06.2023.
//

import iFixFloat

@usableFromInline
struct MSlice {
    
    @usableFromInline
    let a: Int
    
    @usableFromInline
    let b: Int
    
    @inlinable
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

private struct Edge {
    
    static let empty = Edge(id: 0, edge: .empty, triangle: .empty)
    
    let id: Int
    var edge: Int
    var triangle: Int
    
    var isEmpty: Bool { triangle == .empty }
}

struct MSliceBuffer {
    
    private let vertexCount: Int
    private var edges: [Edge]
    private let vertexMarks: [Bool]
    
    private static func id(n: Int, a: Int, b: Int) -> Int {
        if a < b {
            a * n + b
        } else {
            b * n + a
        }
    }
    
    init(vertexCount: Int, slices: [MSlice]) {
        self.vertexCount = vertexCount
        var vertexMark = Array<Bool>(repeating: false, count: vertexCount)
        var edges = Array<Edge>(repeating: .empty, count: slices.count)
        for i in 0..<slices.count {
            let slice = slices[i]

            vertexMark[slice.a] = true
            vertexMark[slice.b] = true

            let id = Self.id(n: vertexCount, a: slice.a, b: slice.b)

            edges[i] = Edge(id: id, edge: .empty, triangle: .empty)
        }
        
        edges.sort(by: { return $0.id < $1.id })
        
        
        self.vertexMarks = vertexMark
        self.edges = edges
    }
    
    mutating func addConections(triangles: inout [DTriangle]) {
        let n = triangles.count
        
        for i in 0..<n {
            var triangle = triangles[i]
            
            var j0 = 1
            var j1 = 2
            for j2 in 0...2 {
                let a = triangle.vertices[j1].index
                let b = triangle.vertices[j2].index
                let edgeIndex = self.find(a: a, b: b)

                if edgeIndex >= 0 {
                    var edge = self.edges[edgeIndex]

                    if edge.isEmpty {
                        edge.triangle = i
                        edge.edge = j0
                        self.edges[edgeIndex] = edge
                    } else {
                        triangle.neighbors[j0] = edge.triangle
                        var neighbor = triangles[edge.triangle]
                        neighbor.neighbors[edge.edge] = i
                        triangles[edge.triangle] = neighbor
                        triangles[i] = triangle
                    }
                }
                
                j0 = j1
                j1 = j2
            }
        }
    }

    private func find(a: Int, b: Int) -> Int {
        guard self.vertexMarks[a] && self.vertexMarks[b] else {
            return .empty
        }
        
        let id = Self.id(n: self.vertexCount, a: a, b: b)
        
        var left = 0
        var right = self.edges.count &- 1
        
        repeat {
            let k: Int
            if left &+ 1 < right {
                k = (left &+ right) >> 1
            } else {
                repeat {
                    if self.edges[left].id == id {
                        return left
                    }
                    left &+= 1
                } while left <= right
                return -1
            }

            let e = self.edges[k].id
            if e > id {
                right = k
            } else if e < id {
                left = k
            } else {
                return k
            }
        } while true
    }
}
