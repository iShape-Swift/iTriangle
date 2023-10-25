//
//  Delaunay+Convex.swift
//
//
//  Created by Nail Sharipov on 25.10.2023.
//

import iFixFloat
import iShape

public struct ConvexPath {
    public let path: FixPath
    public let inner: [Bool]
}

private struct Node {

    var next: Int
    let index: Int
    var prev: Int
    
    let nextInner: Bool

    let point: FixVec
 
    @inlinable
    init(next: Int, index: Int, prev: Int, point: FixVec, nextInner: Bool) {
        self.next = next
        self.index = index
        self.prev = prev
        self.point = point
        self.nextInner = nextInner
    }
}

private struct Edge {
    let triangleIndex: Int
    let neighbor: Int
    let a: Int
    let b: Int
}

private struct Polygon {

    private var nodes: [Node]
    fileprivate var edges: [Edge]
    
    var points: ConvexPath {
        let count = nodes.count
        var path = [FixVec](repeating: .zero, count: count)
        var inner = [Bool](repeating: false, count: count)

        var n = self.nodes[count - 1]
        for i in 0..<count {
            path[i] = n.point
            inner[i] = n.nextInner
            n = self.nodes[n.next]
        }

        return ConvexPath(path: path, inner: inner)
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
        
        let aa = va1 - va0
        let ap = v.point - va1
        
        let apa = aa.crossProduct(ap)
        if apa > 0 {
            return false
        }
        
        // b0 <- b1 <- p
        
        var node_b1 = self.nodes[edge.b]
        let vb0 = self.nodes[node_b1.next].point
        let vb1 = node_b1.point
        
        let bb = vb0 - vb1
        let bp = vb1 - v.point
        
        let bpb = bp.crossProduct(bb)
        if bpb > 0 {
            return false
        }
        
        let n0 = triangle.neighbors[(vIndex + 1) % 3]
        let n1 = triangle.neighbors[(vIndex + 2) % 3]

        let nodeIndex = self.nodes.count
                         
        let newNode = Node(next: node_b1.index, index: nodeIndex, prev: node_a1.index, point: v.point, nextInner: false)
        
        node_a1.next = nodeIndex
        node_b1.prev = nodeIndex
        
        self.nodes.append(newNode)
        self.nodes[node_a1.index] = node_a1
        self.nodes[node_b1.index] = node_b1

        if n0 >= 0 {
            let edge = Edge(triangleIndex: triangle.index, neighbor: n0, a: edge.a, b: nodeIndex)
            self.edges.append(edge)
        }
        
        if n1 >= 0 {
            let edge = Edge(triangleIndex: triangle.index, neighbor: n1, a: nodeIndex, b: edge.b)
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
        
        self.nodes.append(Node(next: 1, index: 0, prev: 2, point: triangle.vertices.a.point, nextInner: ca >= 0))
        self.nodes.append(Node(next: 2, index: 1, prev: 0, point: triangle.vertices.b.point, nextInner: ab >= 0))
        self.nodes.append(Node(next: 0, index: 2, prev: 1, point: triangle.vertices.c.point, nextInner: bc >= 0))
        
        if ab >= 0 {
            self.edges.append(Edge(triangleIndex: triangle.index, neighbor: ab, a: 0, b: 1))
        }

        if bc >= 0 {
            self.edges.append(Edge(triangleIndex: triangle.index, neighbor: bc, a: 1, b: 2))
        }

        if ca >= 0 {
            self.edges.append(Edge(triangleIndex: triangle.index, neighbor: ca, a: 2, b: 0))
        }
    }

}

extension Delaunay {

    public func convexPolygons() -> [ConvexPath] {
        var result = [ConvexPath]()
        let n = self.triangles.count
        
        var visited = [Bool](repeating: false, count: n)
        
        var polygon = Polygon()
        
        for i in 0..<n where !visited[i] {
            let first = self.triangles[i]
            polygon.start(triangle: first)
            visited[i] = true
            
            while !polygon.edges.isEmpty {
                let edge = polygon.edges.removeLast()
                if visited[edge.neighbor] {
                    continue
                }
                let next = self.triangles[edge.neighbor]
                if polygon.add(edge: edge, triangle: next) {
                    visited[edge.neighbor] = true
                }
            }
            
            result.append(polygon.points)
        }

        return result
    }
    
}
