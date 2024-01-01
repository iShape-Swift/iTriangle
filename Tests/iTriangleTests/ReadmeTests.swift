//
//  ReadmeTests.swift
//
//
//  Created by Nail Sharipov on 01.01.2024.
//

import XCTest
import iShape
import iFixFloat
@testable import iTriangle

final class ReadmeTests: XCTestCase {
    
    func test_00() throws {
        
        let shape = FixShape(
            contour: [
                Vec(x:   0, y:  20).fix,     // 0
                Vec(x:   8, y:  10).fix,     // 1
                Vec(x:   7, y:   6).fix,     // 2
                Vec(x:   9, y:   1).fix,     // 3
                Vec(x:  13, y:  -1).fix,     // 4
                Vec(x:  17, y:   1).fix,     // 5
                Vec(x:  26, y:  -7).fix,     // 6
                Vec(x:  14, y: -15).fix,     // 7
                Vec(x:   0, y: -18).fix,     // 8
                Vec(x: -14, y: -15).fix,     // 9
                Vec(x: -25, y:  -7).fix,     // 10
                Vec(x: -18, y:   0).fix,     // 11
                Vec(x: -16, y:  -3).fix,     // 12
                Vec(x: -13, y:  -4).fix,     // 13
                Vec(x:  -8, y:  -2).fix,     // 14
                Vec(x:  -6, y:   2).fix,     // 15
                Vec(x:  -7, y:   6).fix,     // 16
                Vec(x: -10, y:   8).fix      // 17
            ], holes: [
                [
                    Vec(x:   2, y:   0).fix, // 18
                    Vec(x:  -2, y:  -2).fix, // 19
                    Vec(x:  -4, y:  -5).fix, // 20
                    Vec(x:  -2, y:  -9).fix, // 21
                    Vec(x:   2, y: -11).fix, // 22
                    Vec(x:   5, y:  -9).fix, // 23
                    Vec(x:   7, y:  -5).fix, // 24
                    Vec(x:   5, y:  -2).fix  // 25
                ]
            ])
        
        let triangulation = shape.triangulate()
        
        XCTAssertTrue(!triangulation.indices.isEmpty)

        print(triangulation)
    }
}
