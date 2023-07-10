//
//  FlipShape.swift
//  
//
//  Created by Nail Sharipov on 10.07.2023.
//

import iShape

public struct FlipShape {
    
    @usableFromInline
    let paths: [FixPath]
    
    @inlinable
    init(paths: [FixPath]) {
        self.paths = paths
    }
}

public extension FixShape {
    
    @inlinable
    var flip: FlipShape {
        var paths = [FixPath]()
        
        paths.append(contour)
        
        if !holes.isEmpty {
            for hole in holes {
                paths.append(hole.reversed())
            }
        }

        return FlipShape(paths: paths)
    }
}
