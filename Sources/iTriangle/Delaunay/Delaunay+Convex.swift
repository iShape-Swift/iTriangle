//
//  Delaunay+Convex.swift
//
//
//  Created by Nail Sharipov on 25.10.2023.
//

import iFixFloat
import iShape

private struct Node {

    var next: Int
    let index: Int
    var prev: Int

    let point: Point
 
    @inlinable
    init(next: Int, index: Int, prev: Int, point: Point) {
        self.next = next
        self.index = index
        self.prev = prev
        self.point = point
    }
}

private struct Edge {
    let triangleIndex: Int
    let neighbor: Int
    let a: Int
    let b: Int
}

private struct ConvexPolygonBuilder {

    private var nodes: [Node]
    fileprivate var edges: [Edge]
    
    func makePath() -> Path {
        let count = nodes.count
        var path = [Point](repeating: .zero, count: count)

        var n = self.nodes[count - 1]
        for i in 0..<count {
            path[i] = n.point
            n = self.nodes[n.next]
        }

        return path
    }
    
    fileprivate init() {
        nodes = [Node]()
        nodes.reserveCapacity(16)
        edges = [Edge]()
        edges.reserveCapacity(16)
    }
    
    fileprivate mutating func add(edge: Edge, triangle: DTriangle) -> Bool {
        let vIndex = triangle.opposite(neighbor: edge.triangleIndex)
        let v = triangle.vertices[vIndex]

        // a0 -> a1 -> p

        var node_a1 = self.nodes[edge.a]
        let va0 = self.nodes[node_a1.prev].point
        let va1 = node_a1.point
        
        let aa = va1.subtract(va0)
        let ap = v.point.subtract(va1)
        
        let apa = aa.crossProduct(ap)
        if apa > 0 {
            return false
        }
        
        // b0 <- b1 <- p
        
        var node_b1 = self.nodes[edge.b]
        let vb0 = self.nodes[node_b1.next].point
        let vb1 = node_b1.point
        
        let bb = vb0.subtract(vb1)
        let bp = vb1.subtract(v.point)
        
        let bpb = bp.crossProduct(bb)
        if bpb > 0 {
            return false
        }
        
        let prev_neighbor = triangle.neighbors[(vIndex + 2) % 3]
        let next_neighbor = triangle.neighbors[(vIndex + 1) % 3]

        let newIndex = self.nodes.count

        let newNode = Node(next: node_b1.index, index: newIndex, prev: node_a1.index, point: v.point)
        
        node_a1.next = newIndex
        node_b1.prev = newIndex
        
        self.nodes.append(newNode)
        self.nodes[node_a1.index] = node_a1
        self.nodes[node_b1.index] = node_b1

        if next_neighbor >= 0 {
            let edge = Edge(triangleIndex: triangle.index, neighbor: next_neighbor, a: edge.a, b: newIndex)
            self.edges.append(edge)
        }
        
        if prev_neighbor >= 0 {
            let edge = Edge(triangleIndex: triangle.index, neighbor: prev_neighbor, a: newIndex, b: edge.b)
            self.edges.append(edge)
        }

        return true
    }

    mutating func start(triangle: DTriangle) {
        self.nodes.removeAll(keepingCapacity: true)
        self.edges.removeAll(keepingCapacity: true)
        
        let bc = triangle.neighbors.a
        let ca = triangle.neighbors.b
        let ab = triangle.neighbors.c
        
        let isCAInner = ca >= 0
        let isABInner = ab >= 0
        let isBCInner = bc >= 0
        
        self.nodes.append(Node(next: 1, index: 0, prev: 2, point: triangle.vertices.a.point))
        self.nodes.append(Node(next: 2, index: 1, prev: 0, point: triangle.vertices.b.point))
        self.nodes.append(Node(next: 0, index: 2, prev: 1, point: triangle.vertices.c.point))
        
        if isABInner {
            self.edges.append(Edge(triangleIndex: triangle.index, neighbor: ab, a: 0, b: 1))
        }

        if isBCInner {
            self.edges.append(Edge(triangleIndex: triangle.index, neighbor: bc, a: 1, b: 2))
        }

        if isCAInner {
            self.edges.append(Edge(triangleIndex: triangle.index, neighbor: ca, a: 2, b: 0))
        }
    }

}

extension Delaunay {

    public func convexPolygons() -> [Path] {
        var result = [Path]()
        let n = self.triangles.count
        
        var visited = [Bool](repeating: false, count: n)
        
        var builder = ConvexPolygonBuilder()
        
        for i in 0..<n where !visited[i] {
            let first = self.triangles[i]
            builder.start(triangle: first)
            visited[i] = true
            
            while !builder.edges.isEmpty {
                let edge = builder.edges.removeLast()
                if visited[edge.neighbor] {
                    continue
                }
                let triangle = self.triangles[edge.neighbor]
                if builder.add(edge: edge, triangle: triangle) {
                    visited[edge.neighbor] = true
                }
            }
            
            result.append(builder.makePath())
        }

        return result
    }
    
}
