//
//  FixShape.swift
//  
//
//  Created by Nail Sharipov on 10.07.2023.
//

import iShape

public extension FixShape {
    
    func triangulate() -> TResult {
        self.flip.triangulate()
    }
}
