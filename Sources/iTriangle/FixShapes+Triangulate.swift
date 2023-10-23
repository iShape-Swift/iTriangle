//
//  FixShapes.swift
//  
//
//  Created by Nail Sharipov on 14.08.2023.
//

import iShape

public extension FixShapes {
    
    func delaunay() -> [Delaunay] {
        var result = [Delaunay]()
        result.reserveCapacity(self.count)
        for shape in self {
            if let delaunay = shape.flip.delaunay() {
                result.append(delaunay)
            }
        }
        
        return result
    } 
}

