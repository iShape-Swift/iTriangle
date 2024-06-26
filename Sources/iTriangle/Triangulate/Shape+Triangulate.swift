//
//  Shape+Triangulate.swift
//
//
//  Created by Nail Sharipov on 10.07.2023.
//

import iFixFloat
import iShape
import iOverlay

public extension Shape {
    
    /// Triangulates the shape.
    ///
    /// If `validateRule` is provided, the shape will be processed using the poly bool library to ensure correctness
    /// according to the specified fill rule. If `validateRule` is `nil`, the shape is assumed to be "correct" and
    /// will be triangulated as is.
    ///
    /// For more details on the poly bool library: [iOverlay Documentation](https://ishape-rust.github.io/iShape-js/overlay/filling_rules.html)
    ///
    /// - Parameters:
    ///   - validateRule: An optional `FillRule` to validate and fix the shape. Defaults to `.nonZero`.
    ///   - minArea: The minimum area to consider for a shape. Defaults to `0`.
    /// - Returns: A `Triangulation` instance representing the triangulated shape.
    func triangulate(validateRule: FillRule? = .nonZero, minArea: Int64 = 0) -> Triangulation {
        guard let fillRule = validateRule else {
            if let delaunay = self.delaunay() {
                return delaunay.triangulation()
            } else {
                return Triangulation(points: [], indices: [])
            }
        }
        
        let shapes = self.simplify(fillRule: fillRule, minArea: minArea)

        let delaunayList = shapes.delaunay()

        var points = [Point]()
        var indices = [Int]()

        for delaunay in delaunayList {
            let triangulation = delaunay.triangulation(shifted: points.count)
            indices.append(contentsOf: triangulation.indices)
            points.append(contentsOf: triangulation.points)
        }

        return Triangulation(points: points, indices: indices)
    }
    
    /// Decomposes the shape into convex polygons.
    ///
    /// Similar to `triangulate`, if `validateRule` is provided, the shape undergoes a fixing process using the poly
    /// bool library according to the specified fill rule. If `validateRule` is `nil`, the shape is treated as "correct"
    /// and decomposed directly into convex polygons.
    ///
    /// For more details on the poly bool library: [iOverlay Documentation](https://ishape-rust.github.io/iShape-js/overlay/filling_rules.html)
    ///
    /// - Parameters:
    ///   - validateRule: An optional `FillRule` to validate and fix the shape. Defaults to `.nonZero`.
    ///   - minArea: The minimum area to consider for a shape. Defaults to `0`.
    /// - Returns: An array of `ConvexPath` representing the decomposed convex polygons.
    func decomposeToConvexPolygons(validateRule: FillRule? = .nonZero, minArea: Int64 = 0) -> [Path] {
        guard let fillRule = validateRule else {
            if let delaunay = self.delaunay() {
                return delaunay.convexPolygons()
            } else {
                return []
            }
        }
        
        let shapes = self.simplify(fillRule: fillRule, minArea: minArea)
        
        if shapes.count == 1 && shapes[0].isConvexPolygon {
            return shapes[0]
        } else {
            var polygons = [Path]()
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

public extension Shapes {
    
    func delaunay() -> [Delaunay] {
        var result = [Delaunay]()
        result.reserveCapacity(self.count)
        for shape in self {
            if let delaunay = shape.delaunay() {
                result.append(delaunay)
            }
        }
        
        return result
    }
}
