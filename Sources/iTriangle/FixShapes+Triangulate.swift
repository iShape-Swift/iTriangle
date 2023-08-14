//
//  FixShapes.swift
//  
//
//  Created by Nail Sharipov on 14.08.2023.
//

import iShape

public extension FixShapes {
    
    func triangulate() -> [TResult] {
        var result = [TResult]()
        for shape in self {
            result.append(shape.flip.triangulate())
        }
        
        return result
    } 
}

