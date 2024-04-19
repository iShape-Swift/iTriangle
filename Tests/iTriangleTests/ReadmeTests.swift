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
        let shape = [
            [
                CGPoint(x:   0, y:  20),     // 0
                CGPoint(x:   8, y:  10),     // 1
                CGPoint(x:   7, y:   6),     // 2
                CGPoint(x:   9, y:   1),     // 3
                CGPoint(x:  13, y:  -1),     // 4
                CGPoint(x:  17, y:   1),     // 5
                CGPoint(x:  26, y:  -7),     // 6
                CGPoint(x:  14, y: -15),     // 7
                CGPoint(x:   0, y: -18),     // 8
                CGPoint(x: -14, y: -15),     // 9
                CGPoint(x: -25, y:  -7),     // 10
                CGPoint(x: -18, y:   0),     // 11
                CGPoint(x: -16, y:  -3),     // 12
                CGPoint(x: -13, y:  -4),     // 13
                CGPoint(x:  -8, y:  -2),     // 14
                CGPoint(x:  -6, y:   2),     // 15
                CGPoint(x:  -7, y:   6),     // 16
                CGPoint(x: -10, y:   8)      // 17
            ],
            [
                CGPoint(x:   2, y:   0),    // 18
                CGPoint(x:  -2, y:  -2),    // 19
                CGPoint(x:  -4, y:  -5),    // 20
                CGPoint(x:  -2, y:  -9),    // 21
                CGPoint(x:   2, y: -11),    // 22
                CGPoint(x:   5, y:  -9),    // 23
                CGPoint(x:   7, y:  -5),    // 24
                CGPoint(x:   5, y:  -2)     // 25
            ]
        ]
        
        let triangulation = shape.triangulate()
        
        XCTAssertTrue(!triangulation.indices.isEmpty)

        print(triangulation)
    }
}
