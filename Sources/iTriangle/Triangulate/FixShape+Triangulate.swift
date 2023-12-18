//
//  FixShape.swift
//  
//
//  Created by Nail Sharipov on 10.07.2023.
//

import iFixFloat
import iShape
import iOverlay

public extension FixShape {
    
    func triangulate(validateRule: FillRule? = .nonZero, minArea: Int64 = 0) -> Triangulation {
        guard let fillRule = validateRule else {
            if let delaunay = self.delaunay() {
                return delaunay.triangulation()
            } else {
                return Triangulation(points: [], indices: [])
            }
        }
        
        let shapes = self.simplify(fillRule: fillRule, minArea: minArea)
        
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
    
    func decomposeToConvexPolygons(validateRule: FillRule? = .nonZero, minArea: Int64 = 0) -> [ConvexPath] {
        guard let fillRule = validateRule else {
            if let delaunay = self.delaunay() {
                return delaunay.convexPolygons()
            } else {
                return []
            }
        }
        
        let shapes = self.simplify(fillRule: fillRule, minArea: minArea)
        
        if shapes.count == 1 && shapes[0].isConvexPolygon {
            var path = shapes[0].contour
            path.removeDegenerates()
            
            if path.area < 0 {
                path.reverse()
            }
            
            let side = [ConvexSide](repeating: .outer, count: path.count)

            return [ConvexPath(path: path, side: side)]
        } else {
            var polygons = [ConvexPath]()
            for shape in shapes {
                if let delaunay = shape.delaunay() {
                    let subPolygons = delaunay.convexPolygons()
                    polygons.append(contentsOf: subPolygons)
                }
            }

            return polygons
        }
    }

}
