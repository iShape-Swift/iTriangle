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
    
    func triangulate(validate: Bool = true, minArea: Int64 = 0) -> Triangulation {
        guard validate else {
            if let delaunay = self.flip.delaunay() {
                return delaunay.triangulation()
            } else {
                return Triangulation(points: [], indices: [])
            }
        }
        let shapes = self.resolveSelfIntersection(minArea: minArea)
        
        let results = shapes.delaunay()

        var points = [FixVec]()
        var indices = [Int]()

        for delaunay in results {
            let triangulation = delaunay.triangulation(shifted: points.count)
            indices.append(contentsOf: triangulation.indices)
            points.append(contentsOf: triangulation.points)
        }

        return Triangulation(points: points, indices: indices)
    }
    
    func decomposeToConvexPolygons(validate: Bool = true, minArea: Int64 = 0) -> [ConvexPath] {
        guard validate else {
            if let delaunay = self.flip.delaunay() {
                return delaunay.convexPolygons()
            } else {
                return []
            }
        }
        let shapes = self.resolveSelfIntersection(minArea: minArea)
        
        let results = shapes.delaunay()

        var polygons = [ConvexPath]()

        for delaunay in results {
            let subPolygons = delaunay.convexPolygons()
            polygons.append(contentsOf: subPolygons)
        }

        return polygons
    }
    
    func delaunay() -> Delaunay? {
        self.flip.delaunay()
    }
    
}
