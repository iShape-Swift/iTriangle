//
//  CGShape+Triangulate.swift
//  
//
//  Created by Nail Sharipov on 13.04.2024.
//

#if canImport(CoreGraphics)
import CoreGraphics
import iOverlay
import iShape
import iFixFloat

public extension CGShape {
    
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
    /// - Returns: A `CGTriangulation` instance representing the triangulated shape.
    func triangulate(validateRule: FillRule? = .nonZero, minArea: CGFloat = 0) -> CGTriangulation {
        let adapter = PointAdapter(rect: CGRect(shape: self))
        let shape = self.toShape(adapter: adapter)
        let sqrScale = adapter.dirScale * adapter.dirScale
        let iArea = Int64(sqrScale * minArea)
        
        let triangulation = shape.triangulate(validateRule: validateRule, minArea: iArea)
        
        let points = triangulation.points.map({ adapter.convert(point: $0) })

        return CGTriangulation(points: points, indices: triangulation.indices)
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
    /// - Returns: An array of path representing the decomposed convex polygons.
    func decomposeToConvexPolygons(validateRule: FillRule? = .nonZero, minArea: CGFloat = 0) -> [[CGPoint]] {
        let adapter = PointAdapter(rect: CGRect(shape: self))
        let shape = self.toShape(adapter: adapter)
        let sqrScale = adapter.dirScale * adapter.dirScale
        let iArea = Int64(sqrScale * minArea)
        
        let polygons = shape.decomposeToConvexPolygons(validateRule: validateRule, minArea: iArea)

        return polygons.toCGShape(adapter: adapter)
    }

}

#endif
