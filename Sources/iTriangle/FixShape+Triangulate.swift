//
//  FixShape.swift
//  
//
//  Created by Nail Sharipov on 10.07.2023.
//

import iFixFloat
import iShape
import iOverlay

public struct Triangulation {
    
    public let points: [FixVec]
    public let indices: [Int]
    
}

public extension FixShape {
    
    func triangulate(validate: Bool = true) -> Triangulation {
        guard validate else {
            if let delaunay = self.flip.delaunay() {
                return Triangulation(points: delaunay.points, indices: delaunay.trianglesIndices)
            } else {
                return Triangulation(points: [], indices: [])
            }
        }
        let shapes = self.resolveSelfIntersection()
        
        let results = shapes.delaunay()

        var points = [FixVec]()
        var indices = [Int]()
        var offset = 0

        for delaunay in results {
            let subIndices = delaunay.trianglesIndices(shifted: offset)
            indices.append(contentsOf: subIndices)

            let subPoints = delaunay.points
            points.append(contentsOf: subPoints)

            offset += subPoints.count
        }

        return Triangulation(points: points, indices: indices)
    }
    
    func delaunay() -> Delaunay? {
        self.flip.delaunay()
    }
    
}
