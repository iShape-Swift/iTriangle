//
//  DTriangle.swift
//  
//
//  Created by Nail Sharipov on 08.06.2023.
//

import iFixFloat
import iShape

@usableFromInline
struct DTriangle {
    
    @usableFromInline
    let index: Int
    
    @usableFromInline
    // a(0), b(1), c(2)
    var vertices: Array3d<DVertex>
    
    @usableFromInline
    // BC - a(0), AC - b(1), AB - c(2)
    var neighbors: Array3d<Int>

    @inlinable
    init() {
        self.index = .empty
        self.vertices = Array3d(.empty, .empty, .empty)
        self.neighbors = Array3d(.empty, .empty, .empty)
    }
    
    @inlinable
    init(index: Int, a: DVertex, b: DVertex, c: DVertex) {
        self.index = index
        self.vertices = Array3d(a, b, c)
        self.neighbors = Array3d(.empty, .empty, .empty)
        assert(Triangle.isCW_or_Line(p0: a.point, p1: b.point, p2: c.point), "Triangle's points are not clock-wise ordered")
    }
    
    @inlinable
    init(index: Int, a: DVertex, b: DVertex, c: DVertex, bc: Int) {
        self.index = index
        self.vertices = Array3d(.empty, .empty, .empty)
        self.neighbors = Array3d(bc, .empty, .empty)
        assert(Triangle.isCW_or_Line(p0: a.point, p1: b.point, p2: c.point), "Triangle's points are not clock-wise ordered")
    }
    
    @inlinable
    init(index: Int, a: DVertex, b: DVertex, c: DVertex, ac: Int, ab: Int) {
        self.index = index
        self.vertices = Array3d(a, b, c)
        self.neighbors = Array3d(.empty, ac, ab)
        assert(Triangle.isCW_or_Line(p0: a.point, p1: b.point, p2: c.point), "Triangle's points are not clock-wise ordered")
    }
    
    @inlinable
    init(index: Int, a: DVertex, b: DVertex, c: DVertex, bc: Int, ac: Int, ab: Int) {
        self.index = index
        self.vertices = Array3d(a, b, c)
        self.neighbors = Array3d(bc, ac, ab)
        assert(Triangle.isCW_or_Line(p0: a.point, p1: b.point, p2: c.point), "Triangle's points are not clock-wise ordered")
    }
    
    @inlinable
    func vertex(neighbor: Int) -> DVertex {
        if neighbors.a == neighbor {
            return vertices.a
        } else if neighbors.b == neighbor {
            return vertices.b
        } else if neighbors.c == neighbor {
            return vertices.c
        }
        
        assertionFailure("Neighbor is not present")
        
        return DVertex.empty
    }
    
    @inlinable
    func opposite(neighbor: Int) -> Int {
        if neighbors.a == neighbor {
            return 0
        } else if neighbors.b == neighbor {
            return 1
        } else if neighbors.c == neighbor {
            return 2
        }
        assertionFailure("Neighbor is not present")
        
        return .empty
    }
    
    @inlinable
    func adjacentNeighbor(vertex: Int, neighbor: Int) -> Int {
        if vertices.a.index != vertex && neighbors.a != neighbor {
            return 0
        } else if vertices.b.index != vertex && neighbors.b != neighbor {
            return 1
        } else if vertices.c.index != vertex && neighbors.c != neighbor {
            return 2
        }

        assertionFailure("Neighbor is not present")
        return .empty
    }
    
    @inlinable
    func index(index: Int) -> Int {
        if vertices.a.index == index {
            return 0
        } else if vertices.b.index == index {
            return 1
        } else {
            return 2
        }
    }
    
    @inlinable
    mutating func updateOpposite(oldNeighbor: Int, newNeighbor: Int) {
        let index = self.opposite(neighbor: oldNeighbor)
        self.neighbors[index] = newNeighbor
    }
    
    @inlinable
    mutating func update(vertex: DVertex) {
        if vertices.a.index == vertex.index {
            vertices.a = vertex
        } else if vertices.b.index == vertex.index {
            vertices.b = vertex
        } else if vertices.c.index == vertex.index {
            vertices.c = vertex
        }
    }
    
    @inlinable
    func neighbor(vertex: Int) -> Int {
        if vertices.a.index == vertex {
            return self.neighbors.a
        } else if vertices.b.index == vertex {
            return self.neighbors.b
        } else if vertices.c.index == vertex {
            return self.neighbors.c
        }
        
        assertionFailure("Point is not present")
        
        return .empty
    }
}
