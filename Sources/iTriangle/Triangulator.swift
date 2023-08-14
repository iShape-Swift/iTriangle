//
//  Triangulator.swift
//  
//
//  Created by Nail Sharipov on 14.08.2023.
//

import iShape
import iOverlay
import CoreGraphics

public struct Triangulation {
    
    let points: [CGPoint]
    let indices: [Int]
    
}


public struct Triangulator {
    
    public static func triangulate(paths: [[CGPoint]]) -> Triangulation {
        let contours = paths.map({ $0.map({ $0.fix }) })

        var overlay = Overlay()
        overlay.add(paths: contours, type: .subject)
        let shapes = overlay.buildGraph().extractShapes(fillRule: .subject)
        
        let tResults = shapes.triangulate()
        
        var points = [CGPoint]()
        var indices = [Int]()
        var offset = 0
        
        for t in tResults {
            let subIndices = t.delaunay.trianglesIndices(shifted: offset)
            indices.append(contentsOf: subIndices)
            
            let subPoints = t.delaunay.points.map({ $0.cgPoint })
            points.append(contentsOf: subPoints)

            offset += subPoints.count
        }
        
        return Triangulation(points: points, indices: indices)
    }
    
}
