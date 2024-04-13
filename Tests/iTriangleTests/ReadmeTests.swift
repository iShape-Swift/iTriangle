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
                Point(x:   0, y:  20),     // 0
                Point(x:   8, y:  10),     // 1
                Point(x:   7, y:   6),     // 2
                Point(x:   9, y:   1),     // 3
                Point(x:  13, y:  -1),     // 4
                Point(x:  17, y:   1),     // 5
                Point(x:  26, y:  -7),     // 6
                Point(x:  14, y: -15),     // 7
                Point(x:   0, y: -18),     // 8
                Point(x: -14, y: -15),     // 9
                Point(x: -25, y:  -7),     // 10
                Point(x: -18, y:   0),     // 11
                Point(x: -16, y:  -3),     // 12
                Point(x: -13, y:  -4),     // 13
                Point(x:  -8, y:  -2),     // 14
                Point(x:  -6, y:   2),     // 15
                Point(x:  -7, y:   6),     // 16
                Point(x: -10, y:   8)      // 17
            ],
            [
                Point(x:   2, y:   0), // 18
                Point(x:  -2, y:  -2), // 19
                Point(x:  -4, y:  -5), // 20
                Point(x:  -2, y:  -9), // 21
                Point(x:   2, y: -11), // 22
                Point(x:   5, y:  -9), // 23
                Point(x:   7, y:  -5), // 24
                Point(x:   5, y:  -2)  // 25
            ]
        ]
        
        let triangulation = shape.triangulate()
        
        XCTAssertTrue(!triangulation.indices.isEmpty)

        print(triangulation)
    }
}
