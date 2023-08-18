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
            let result = self.flip.triangulate()
            return Triangulation(
                points: result.delaunay.points,
                indices: result.delaunay.trianglesIndices
            )
        }
        let shapes = self.resolveSelfIntersection()
        
        let tResults = shapes.triangulate()

        var points = [FixVec]()
        var indices = [Int]()
        var offset = 0

        for t in tResults {
            let subIndices = t.delaunay.trianglesIndices(shifted: offset)
            indices.append(contentsOf: subIndices)

            let subPoints = t.delaunay.points
            points.append(contentsOf: subPoints)

            offset += subPoints.count
        }

        return Triangulation(points: points, indices: indices)
    }
    
    func delaunay() -> Delaunay {
        self.flip.triangulate().delaunay
    }
    
}
