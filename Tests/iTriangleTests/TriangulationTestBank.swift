//
//  TriangulationTestBank.swift
//
//
//  Created by Nail Sharipov on 24.10.2023.
//

import iShape
import iFixFloat

struct TriangulationTest {
    let shape: FixShape
    let points: FixPath
    let indices: [Int]
}

struct TriangulationTestBank {
    
    static let data: [TriangulationTest] = [
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-20, -20),
                FixVec(-20,  20),
                FixVec( 20,  20),
                FixVec( 20, -20)
            ]),
            points: [
                FixVec(-20, -20),
                FixVec(-20,  20),
                FixVec( 20,  20),
                FixVec( 20, -20)
            ],
            indices: [0, 1, 3, 1, 2, 3]
        ),
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,   0),
                FixVec(  0,  15),
                FixVec( 15,   0),
                FixVec(  0, -15)
            ]),
            points: [
                FixVec(0, 15),
                FixVec(15, 0),
                FixVec(0, -15),
                FixVec(-15, 0)
            ],
            indices: [3, 0, 2, 2, 0, 1]
        ),
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15, -15),
                FixVec(-25,   0),
                FixVec(-15,  15),
                FixVec( 15,  15),
                FixVec( 25,   0),
                FixVec( 15, -15)
            ]),
            points: [
                FixVec(-15, 15),
                FixVec(15, 15),
                FixVec(25, 0),
                FixVec(15, -15),
                FixVec(-15, -15),
                FixVec(-25, 0)
            ],
            indices: [5, 0, 4, 4, 0, 3, 0, 1, 3, 3, 1, 2]
        ),
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec( -5, -15),
                FixVec(-10,   0),
                FixVec(  0,  15),
                FixVec( 10,   5),
                FixVec(  5,  -10)
            ]),
            points: [
                FixVec(0, 15),
                FixVec(10, 5),
                FixVec(5, -10),
                FixVec(-5, -15),
                FixVec(-10, 0)
            ],
            indices: [1, 4, 0, 4, 2, 3, 1, 2, 4]
        ),
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-20, -20),
                    FixVec(-20,  20),
                    FixVec( 20,  20),
                    FixVec( 20, -20)
                ],
                [
                    FixVec(-10, -10),
                    FixVec( 10, -10),
                    FixVec( 10,  10),
                    FixVec(-10,  10)
                ]
            ]),
            points: [
                FixVec(-20, -20),
                FixVec(-20, 20),
                FixVec(20, 20),
                FixVec(20, -20),
                FixVec(10, -10),
                FixVec(10, 10),
                FixVec(-10, 10),
                FixVec(-10, -10)
            ],
            indices: [0, 1, 7, 7, 1, 6, 6, 1, 5, 1, 2, 5, 7, 4, 0, 0, 4, 3, 4, 5, 3, 5, 2, 3]
        ),
        TriangulationTest(
            shape: FixShape(contour: []),
            points: [],
            indices: []
        ),
        TriangulationTest(
            shape: FixShape(contour: []),
            points: [],
            indices: []
        ),
    ]
    
}
