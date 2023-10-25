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
        // 0
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-20, -20),
                FixVec(-20,  20),
                FixVec(20,  20),
                FixVec(20, -20)
            ]),
            points: [
                FixVec(-20, -20),
                FixVec(-20,  20),
                FixVec(20,  20),
                FixVec(20, -20)
            ],
            indices: [0, 1, 3, 1, 2, 3]
        ),
        // 1
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,   0),
                FixVec( 0,  15),
                FixVec(15,   0),
                FixVec( 0, -15)
            ]),
            points: [
                FixVec(0, 15),
                FixVec(15, 0),
                FixVec(0, -15),
                FixVec(-15, 0)
            ],
            indices: [3, 0, 2, 2, 0, 1]
        ),
        // 2
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15, -15),
                FixVec(-25,   0),
                FixVec(-15,  15),
                FixVec(15,  15),
                FixVec(25,   0),
                FixVec(15, -15)
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
        // 3
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-5, -15),
                FixVec(-10,   0),
                FixVec( 0,  15),
                FixVec(10,   5),
                FixVec( 5,  -10)
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
        // 4
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-20, -20),
                    FixVec(-20,  20),
                    FixVec(20,  20),
                    FixVec(20, -20)
                ],
                [
                    FixVec(-10, -10),
                    FixVec(10, -10),
                    FixVec(10,  10),
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
        // 5
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-15,   0),
                    FixVec( 0,  15),
                    FixVec(15,   0),
                    FixVec( 0, -15)
                ],
                [
                    FixVec(-5,  0),
                    FixVec(0, -5),
                    FixVec(5,  0),
                    FixVec(0,  5)
                ]
            ]),
            points: [
                FixVec(0, 15),
                FixVec(15, 0),
                FixVec(0, -15),
                FixVec(-15, 0),
                FixVec(-5, 0),
                FixVec(0, -5),
                FixVec(5, 0),
                FixVec(0, 5)
            ],
            indices: [4, 3, 7, 3, 0, 7, 7, 0, 6, 0, 1, 6, 3, 4, 2, 4, 5, 2, 5, 6, 2, 2, 6, 1]
        ),
        // 6
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10, -10),
                FixVec( 0,   0),
                FixVec(-10,  10),
                FixVec(10,   0)
            ]),
            points: [
                FixVec(-10, -10),
                FixVec(0, 0),
                FixVec(-10, 10),
                FixVec(10, 0)
            ],
            indices: [0, 1, 3, 2, 3, 1]
        ),
        // 7
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   0),
                FixVec(10,  10),
                FixVec( 0,   0),
                FixVec(10, -10)
            ]),
            points: [
                FixVec(10, 10),
                FixVec(0, 0),
                FixVec(10, -10),
                FixVec(-10, 0)
            ],
            indices: [3, 0, 1, 3, 1, 2]
        ),
        // 8
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,    0),
                FixVec(-20,   20),
                FixVec( -5,   20),
                FixVec(  0,   10),
                FixVec(  5,   20),
                FixVec( 20,   20),
                FixVec( 10,    0),
                FixVec( 20,  -20),
                FixVec(  5,  -20),
                FixVec(  0,  -10),
                FixVec( -5,  -20),
                FixVec(-20,  -20)
            ]),
            points: [
                FixVec(-20, -20), FixVec(-10, 0), FixVec(-20, 20), FixVec(-5, 20), FixVec(0, 10), FixVec(5, 20), FixVec(20, 20), FixVec(10, 0), FixVec(20, -20), FixVec(5, -20), FixVec(0, -10), FixVec(-5, -20)
            ],
            indices: [0, 1, 11, 2, 3, 1, 4, 1, 3, 1, 10, 11, 4, 10, 1, 10, 4, 7, 4, 5, 7, 10, 7, 9, 5, 6, 7, 9, 7, 8]
        ),
        // 9
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(  0,   -5),
                FixVec(  0,    0),
                FixVec( 10,  -10),
                FixVec(-10,  -10)
            ]),
            points: [
                FixVec(-10, -10), FixVec(0, -5), FixVec(0, 0), FixVec(10, -10)
            ],
            indices: [0, 1, 3, 1, 2, 3]
        ),
        // 10
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,  -15),
                FixVec(-15,    0),
                FixVec(  0,    0),
                FixVec(  0,   15),
                FixVec( 15,  -15)
            ]),
            points: [
                FixVec(-15, -15), FixVec(-15, 0), FixVec(0, 0), FixVec(0, 15), FixVec(15, -15)
            ],
            indices: [1, 2, 0, 0, 2, 4, 2, 3, 4]
        ),
        // 11
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,  -15),
                FixVec(-15,    0),
                FixVec( -1,   20),
                FixVec(  0,    5),
                FixVec( 15,  -15)
            ]),
            points: [
                FixVec(-15, -15), FixVec(-15, 0), FixVec(-1, 20), FixVec(0, 5), FixVec(15, -15)
            ],
            indices: [1, 2, 3, 1, 3, 0, 0, 3, 4]
        ),
        // 12
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,    0),
                FixVec( 10,   10),
                FixVec(  0,    0),
                FixVec( 10,  -20),
                FixVec(-10,  -20)
            ]),
            points: [
                FixVec(-10, -20), FixVec(-10, 0), FixVec(10, 10), FixVec(0, 0), FixVec(10, -20)
            ],
            indices: [0, 1, 3, 1, 2, 3, 0, 3, 4]
        ),
        // 13
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,  -15),
                FixVec(-10,  0),
                FixVec(-15,  15),
                FixVec(15,  15),
                FixVec(15,  -15)
            ]),
            points: [
                FixVec(-15, -15), FixVec(-10, 0), FixVec(-15, 15), FixVec(15, 15), FixVec(15, -15)
            ],
            indices: [0, 1, 4, 1, 3, 4, 2, 3, 1]
        ),
        // 14
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,  -15),
                FixVec(-15,   -5),
                FixVec(-20,   15),
                FixVec( 15,   15),
                FixVec( 15,  -15)
            ]),
            points: [
                FixVec(15, 15), FixVec(15, -15), FixVec(-15, -15), FixVec(-15, -5), FixVec(-20, 15)
            ],
            indices: [4, 0, 3, 2, 3, 1, 3, 0, 1]
        ),
        // 15
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,    0),
                FixVec( -5,   10),
                FixVec(-10,   15),
                FixVec(  5,   20),
                FixVec( 15,    0),
                FixVec(  5,  -20),
                FixVec(-10,  -15),
                FixVec( -5,  -10)
            ]),
            points: [
                FixVec(-5, 10), FixVec(-10, 15), FixVec(5, 20), FixVec(15, 0), FixVec(5, -20), FixVec(-10, -15), FixVec(-5, -10), FixVec(-15, 0)
            ],
            indices: [7, 0, 6, 5, 6, 4, 6, 0, 3, 1, 2, 0, 0, 2, 3, 6, 3, 4]
        ),
        // 16
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,    0),
                FixVec(-15,   10),
                FixVec(-10,   15),
                FixVec(  5,   20),
                FixVec( 15,    0),
                FixVec(  5,  -20),
                FixVec(-10,  -15),
                FixVec( -5,  -10)
            ]),
            points: [
                FixVec(-15, 0), FixVec(-15, 10), FixVec(-10, 15), FixVec(5, 20), FixVec(15, 0), FixVec(5, -20), FixVec(-10, -15), FixVec(-5, -10)
            ],
            indices: [1, 2, 0, 0, 2, 7, 2, 3, 4, 2, 4, 7, 4, 5, 7, 6, 7, 5]
        ),
        // 17
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(  5,    0),
                FixVec(-10,    5),
                FixVec(-10,   15),
                FixVec(  5,   20),
                FixVec( 15,    0),
                FixVec(  5,  -20),
                FixVec(-10,  -15),
                FixVec(-10,   -5)
            ]),
            points: [
                FixVec(-10, -15), FixVec(-10, -5), FixVec(5, 0), FixVec(-10, 5), FixVec(-10, 15), FixVec(5, 20), FixVec(15, 0), FixVec(5, -20)
            ],
            indices: [0, 1, 7, 1, 2, 7, 2, 5, 6, 2, 6, 7, 3, 4, 2, 4, 5, 2]
        ),
        // 18
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(  0,    0),
                FixVec(-10,    5),
                FixVec(-10,   15),
                FixVec( 10,   15),
                FixVec(  5,   10),
                FixVec( 10,  -15),
                FixVec(-10,  -15),
                FixVec(-10,   -5)
            ]),
            points: [
                FixVec(-10, -15), FixVec(-10, -5), FixVec(0, 0), FixVec(-10, 5), FixVec(-10, 15), FixVec(10, 15), FixVec(5, 10), FixVec(10, -15)
            ],
            indices: [1, 2, 0, 0, 2, 7, 2, 6, 7, 3, 4, 6, 3, 6, 2, 4, 5, 6]
        ),
        // 19
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-15,    0),
                FixVec( -5,   10),
                FixVec(-10,   15),
                FixVec(  5,   20),
                FixVec(  0,    0),
                FixVec(  5,  -20),
                FixVec(-10,  -15),
                FixVec( -5,  -10)
            ]),
            points: [
                FixVec(-5, 10), FixVec(-10, 15), FixVec(5, 20), FixVec(0, 0), FixVec(5, -20), FixVec(-10, -15), FixVec(-5, -10), FixVec(-15, 0)
            ],
            indices: [7, 0, 3, 7, 3, 6, 5, 6, 4, 6, 3, 4, 1, 2, 0, 0, 2, 3]
        ),
        // 20
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec.float( -15,    0),
                FixVec.float(  -5,   10),
                FixVec.float( -10,   15),
                FixVec.float(-2.5,   20),
                FixVec.float(   5,   20),
                FixVec.float( 2.5,   10),
                FixVec.float(   0,    0),
                FixVec.float( 2.5,  -10),
                FixVec.float(   5,  -20),
                FixVec.float(-2.5,  -20),
                FixVec.float( -10,  -15),
                FixVec.float(  -5,  -10)
            ]),
            points: [FixVec(-5120, 10240), FixVec(-10240, 15360), FixVec(-2560, 20480), FixVec(5120, 20480), FixVec(0, 0), FixVec(5120, -20480), FixVec(-2560, -20480), FixVec(-10240, -15360), FixVec(-5120, -10240), FixVec(-15360, 0)]
            ,
            indices: [4, 9, 0, 7, 8, 6, 4, 8, 9, 3, 0, 2, 8, 4, 5, 3, 4, 0, 1, 2, 0, 8, 5, 6]
        ),
        // 21
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec.float( -15,    0),
                FixVec.float(  -5,   10),
                FixVec.float( -10,   15),
                FixVec.float(-2.5,   20),
                FixVec.float(   5,   20),
                FixVec.float(-2.5,  -15),
                FixVec.float(   5,  -20),
                FixVec.float(-2.5,  -20),
                FixVec.float( -10,  -15),
                FixVec.float(  -5,  -10)
            ]),
            points: [FixVec(-5120, 10240), FixVec(-10240, 15360), FixVec(-2560, 20480), FixVec(5120, 20480), FixVec(-2560, -15360), FixVec(5120, -20480), FixVec(-2560, -20480), FixVec(-10240, -15360), FixVec(-5120, -10240), FixVec(-15360, 0)]
            ,
            indices: [9, 0, 8, 7, 8, 4, 8, 0, 3, 7, 4, 6, 6, 4, 5, 1, 2, 0, 0, 2, 3, 8, 3, 4]
        ),
        // 22
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   10),
                FixVec( -5,    5),
                FixVec( 10,   20),
                FixVec( 20,   20),
                FixVec( 25,   20),
                FixVec( 25,   -5),
                FixVec( 10,   -5),
                FixVec( 10,  -10),
                FixVec(-10,  -10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(-5, 5), FixVec(10, 20), FixVec(25, 20), FixVec(25, -5), FixVec(10, -5), FixVec(10, -10)]
            ,
            indices: [1, 2, 0, 0, 2, 6, 0, 6, 7, 2, 3, 6, 6, 3, 5, 3, 4, 5]
        ),
        // 23
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   10),
                FixVec( -5,   15),
                FixVec( 10,   20),
                FixVec( 20,   20),
                FixVec( 25,   20),
                FixVec( 25,   -5),
                FixVec( 10,   -5),
                FixVec( 10,  -10),
                FixVec(-10,  -10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(-5, 15), FixVec(10, 20), FixVec(25, 20), FixVec(25, -5), FixVec(10, -5), FixVec(10, -10)]
            ,
            indices: [6, 1, 2, 0, 1, 6, 0, 6, 7, 2, 3, 6, 6, 3, 5, 3, 4, 5]
        ),
        // 24
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   10),
                FixVec( -5,    5),
                FixVec( 10,   20),
                FixVec( 15,   10),
                FixVec( 25,   20),
                FixVec( 25,    0),
                FixVec( 10,    0),
                FixVec( 10,  -10),
                FixVec(-10,  -10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(-5, 5), FixVec(10, 20), FixVec(15, 10), FixVec(25, 20), FixVec(25, 0), FixVec(10, 0), FixVec(10, -10)]
            ,
            indices: [1, 2, 0, 0, 2, 8, 8, 2, 7, 2, 3, 4, 2, 4, 7, 7, 4, 6, 4, 5, 6]
        ),
        // 25
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   10),
                FixVec( -5,   -5),
                FixVec( 10,   20),
                FixVec( 15,   10),
                FixVec( 25,   20),
                FixVec( 25,    0),
                FixVec( 10,    0),
                FixVec( 10,  -10),
                FixVec(-10,  -10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(-5, -5), FixVec(10, 20), FixVec(15, 10), FixVec(25, 20), FixVec(25, 0), FixVec(10, 0), FixVec(10, -10)]
            ,
            indices: [1, 2, 0, 0, 2, 8, 8, 2, 7, 2, 3, 7, 3, 4, 7, 7, 4, 6, 4, 5, 6]
        ),
        // 26
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   10),
                FixVec( 10,   10),
                FixVec( 10,   20),
                FixVec( 15,   10),
                FixVec( 25,   20),
                FixVec( 25,    0),
                FixVec( 10,    0),
                FixVec( 10,  -10),
                FixVec(-10,  -10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(10, 10), FixVec(10, 20), FixVec(15, 10), FixVec(25, 20), FixVec(25, 0), FixVec(10, 0), FixVec(10, -10)]
            ,
            indices: [0, 1, 7, 0, 7, 8, 1, 2, 7, 2, 3, 4, 2, 4, 7, 7, 4, 6, 4, 5, 6]
        ),
        // 27
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-35,    5),
                FixVec(-20,   10),
                FixVec(-18,   20),
                FixVec(  0,   20),
                FixVec(  5,   10),
                FixVec( 15,    5),
                FixVec( 20,   10),
                FixVec( 35,    0),
                FixVec( 25,  -10),
                FixVec( 10,   -4),
                FixVec( -5,  -15),
                FixVec( -5,  -20),
                FixVec(-15,  -25),
                FixVec(-20,  -10),
                FixVec(-30,   -5)
            ]),
            points: [FixVec(-20, 10), FixVec(-18, 20), FixVec(0, 20), FixVec(5, 10), FixVec(15, 5), FixVec(20, 10), FixVec(35, 0), FixVec(25, -10), FixVec(10, -4), FixVec(-5, -15), FixVec(-5, -20), FixVec(-15, -25), FixVec(-20, -10), FixVec(-30, -5), FixVec(-35, 5)]
            ,
            indices: [13, 14, 0, 13, 0, 12, 2, 0, 1, 12, 0, 9, 12, 9, 11, 11, 9, 10, 2, 3, 0, 0, 3, 9, 9, 3, 8, 3, 4, 8, 4, 5, 7, 4, 7, 8, 5, 6, 7]
        ),
        // 28
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-35,    5),
                FixVec(-20,   10),
                FixVec(-10,   20),
                FixVec(  0,   20),
                FixVec(  5,   10),
                FixVec( 15,    5),
                FixVec( 20,   10),
                FixVec( 35,    0),
                FixVec( 25,  -10),
                FixVec( 10,   -4),
                FixVec( -5,  -15),
                FixVec( -5,  -20),
                FixVec(-15,  -25),
                FixVec(-20,  -10),
                FixVec(-30,   -5)
            ]),
            points: [FixVec(-20, 10), FixVec(-10, 20), FixVec(0, 20), FixVec(5, 10), FixVec(15, 5), FixVec(20, 10), FixVec(35, 0), FixVec(25, -10), FixVec(10, -4), FixVec(-5, -15), FixVec(-5, -20), FixVec(-15, -25), FixVec(-20, -10), FixVec(-30, -5), FixVec(-35, 5)]
            ,
            indices: [13, 14, 0, 13, 0, 12, 0, 1, 3, 9, 12, 0, 9, 11, 12, 11, 9, 10, 1, 2, 3, 0, 3, 9, 9, 3, 8, 3, 4, 8, 4, 5, 7, 4, 7, 8, 5, 6, 7]
        ),
        // 29
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec.float(-10,  -10),
                FixVec.float(-10,   -5),
                FixVec.float(-10,    0),
                FixVec.float(-10,    5),
                FixVec.float(-10,   10),
                FixVec.float( 10,   10),
                FixVec.float( 10,    5),
                FixVec.float( 10,    0),
                FixVec.float( 10,   -5),
                FixVec.float( 10,  -10)
            ]),
            points: [FixVec(-10240, -10240), FixVec(-10240, 10240), FixVec(10240, 10240), FixVec(10240, -10240)]
            ,
            indices: [0, 1, 3, 1, 2, 3]
        ),
        // 30
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-20,    0),
                FixVec(-15,   15),
                FixVec(-10,   20),
                FixVec( -5,   15),
                FixVec(  0,   20),
                FixVec(  5,   15),
                FixVec( 10,   20),
                FixVec( 15,   15),
                FixVec( 25,    0),
                FixVec( 20,  -15),
                FixVec( 15,  -20),
                FixVec( 10,  -15),
                FixVec(  5,  -20),
                FixVec(  0,  -15),
                FixVec( -5,  -20),
                FixVec(-10,  -15)
            ]),
            points: [FixVec(-20, 0), FixVec(-15, 15), FixVec(-10, 20), FixVec(-5, 15), FixVec(0, 20), FixVec(5, 15), FixVec(10, 20), FixVec(15, 15), FixVec(25, 0), FixVec(20, -15), FixVec(15, -20), FixVec(10, -15), FixVec(5, -20), FixVec(0, -15), FixVec(-5, -20), FixVec(-10, -15)]
            ,
            indices: [0, 1, 3, 3, 1, 2, 13, 0, 3, 13, 15, 0, 13, 14, 15, 5, 3, 4, 5, 13, 3, 11, 13, 5, 11, 12, 13, 7, 5, 6, 8, 5, 7, 8, 11, 5, 9, 10, 11, 11, 8, 9]
        ),
        // 31
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-20,   5),
                FixVec(-10,   10),
                FixVec( -5,   20),
                FixVec(  0,   25),
                FixVec(  5,   15),
                FixVec( 10,    0),
                FixVec( 15,    5),
                FixVec( 20,   -5),
                FixVec( 15,  -15),
                FixVec(  5,  -25),
                FixVec(  0,  -15),
                FixVec(-10,  -10),
                FixVec(-15,   -5)
            ]),
            points: [FixVec(-10, 10), FixVec(-5, 20), FixVec(0, 25), FixVec(5, 15), FixVec(10, 0), FixVec(15, 5), FixVec(20, -5), FixVec(15, -15), FixVec(5, -25), FixVec(0, -15), FixVec(-10, -10), FixVec(-15, -5), FixVec(-20, 5)]
            ,
            indices: [11, 12, 0, 11, 0, 10, 0, 1, 3, 4, 10, 0, 3, 1, 2, 4, 0, 3, 4, 9, 10, 9, 4, 7, 9, 7, 8, 4, 5, 6, 4, 6, 7]
        ),
        // 32
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-350,    50),
                FixVec(-135,    80),
                FixVec( -95,   200),
                FixVec(  30,   200),
                FixVec(  85,   110),
                FixVec( 150,    50),
                FixVec(  32,   145),
                FixVec( 350,     0),
                FixVec( 250,  -100),
                FixVec(   0,    15),
                FixVec(  -5,  -125),
                FixVec( -50,  -200),
                FixVec( -75,    25),
                FixVec(-310,   -40)
            ]),
            points: [FixVec(-135, 80), FixVec(-95, 200), FixVec(30, 200), FixVec(75, 126), FixVec(32, 145), FixVec(150, 50), FixVec(85, 110), FixVec(75, 126), FixVec(350, 0), FixVec(250, -100), FixVec(0, 15), FixVec(-5, -125), FixVec(-50, -200), FixVec(-75, 25), FixVec(-310, -40), FixVec(-350, 50)]
            ,
            indices: [15, 0, 14, 14, 0, 13, 4, 0, 1, 12, 13, 11, 4, 13, 0, 13, 10, 11, 1, 2, 4, 13, 4, 10, 4, 5, 10, 10, 5, 9, 2, 3, 4, 6, 7, 5, 7, 8, 5, 5, 8, 9]
        ),
        // 33
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   5),
                FixVec( -5,   5),
                FixVec(  0,   0),
                FixVec(  5,   5),
                FixVec( 10,   5),
                FixVec( 10,  -5),
                FixVec(  5,  -5),
                FixVec(  0,   0),
                FixVec( -5,  -5),
                FixVec(-10,  -5)
            ]),
            points: [FixVec(-10, -5), FixVec(-10, 5), FixVec(-5, 5), FixVec(0, 0), FixVec(-5, -5), FixVec(5, 5), FixVec(10, 5), FixVec(10, -5), FixVec(5, -5), FixVec(0, 0)]
            ,
            indices: [0, 1, 4, 1, 2, 4, 4, 2, 3, 9, 5, 8, 8, 5, 7, 5, 6, 7]
        ),
        // 34
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec.float(-0.5,   -5),
                FixVec.float( -10,    0),
                FixVec.float( -10,   10),
                FixVec.float(  20,   10),
                FixVec.float(  10,    5),
                FixVec.float(  10,    0),
                FixVec.float(   5,    5),
                FixVec.float(   0,  -15)
            ]),
            points: [FixVec(-10240, 0), FixVec(-10240, 10240), FixVec(20480, 10240), FixVec(10240, 5120), FixVec(10240, 0), FixVec(5120, 5120), FixVec(0, -15360), FixVec(-512, -5120)]
            ,
            indices: [0, 1, 5, 6, 7, 5, 0, 5, 7, 4, 5, 3, 5, 1, 2, 5, 2, 3]
        ),
        // 35
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec( -5,   -5),
                FixVec(-20,   10),
                FixVec( 20,   10),
                FixVec( 15,   -5),
                FixVec(  5,    5),
                FixVec(  0,  -15)
            ]),
            points: [FixVec(20, 10), FixVec(15, -5), FixVec(5, 5), FixVec(0, -15), FixVec(-5, -5), FixVec(-20, 10)]
            ,
            indices: [3, 4, 2, 4, 5, 2, 5, 0, 2, 2, 0, 1]
        ),
        // 36
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-150,  150),
                FixVec( 30,  150),
                FixVec( 50,   50),
                FixVec(100,  -40),
                FixVec(170,  -80),
                FixVec( 90, -100),
                FixVec( 85,  -70),
                FixVec(-50,   20)
            ]),
            points: [FixVec(30, 150), FixVec(50, 50), FixVec(100, -40), FixVec(170, -80), FixVec(90, -100), FixVec(85, -70), FixVec(-50, 20), FixVec(-150, 150)]
            ,
            indices: [7, 0, 6, 0, 1, 6, 6, 1, 5, 1, 2, 5, 5, 2, 3, 5, 3, 4]
        ),
        // 37
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-40,   40),
                    FixVec( 40,   40),
                    FixVec( 40,  -40),
                    FixVec(-40,  -40)
                ],
                [
                    FixVec(  5,    0),
                    FixVec( 10,  -10),
                    FixVec( 25,    0),
                    FixVec( 15,    5)
                ],
                [
                    FixVec(-15,  -25),
                    FixVec(  5,  -15),
                    FixVec( -5,   -5),
                    FixVec(  5,   10),
                    FixVec(  5,   20),
                    FixVec(-15,   20)
                ]
            ]),
            points: [FixVec(-40, -40), FixVec(-40, 40), FixVec(40, 40), FixVec(40, -40), FixVec(5, -15), FixVec(-5, -5), FixVec(5, 10), FixVec(5, 20), FixVec(-15, 20), FixVec(-15, -25), FixVec(5, 0), FixVec(10, -10), FixVec(25, 0), FixVec(15, 5)]
            ,
            indices: [0, 1, 8, 0, 8, 9, 8, 1, 7, 13, 7, 2, 1, 2, 7, 13, 2, 12, 9, 4, 3, 10, 11, 4, 3, 11, 12, 9, 3, 0, 3, 4, 11, 12, 2, 3, 4, 5, 10, 5, 6, 10, 13, 6, 7, 13, 10, 6]
        ),
        // 38
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-5,    0),
                    FixVec(-25,   15),
                    FixVec( 20,   15),
                    FixVec( 20,  -15),
                    FixVec(-25,  -15)
                ],
                [
                    FixVec(-15,  -10),
                    FixVec( 10,  -10),
                    FixVec( 10,   10),
                    FixVec(-10,   10),
                    FixVec(  0,    0)
                ]
            ]),
            points: [FixVec(-25, -15), FixVec(-5, 0), FixVec(-25, 15), FixVec(20, 15), FixVec(20, -15), FixVec(10, -10), FixVec(10, 10), FixVec(-10, 10), FixVec(0, 0), FixVec(-15, -10)]
            ,
            indices: [0, 1, 9, 9, 1, 8, 7, 2, 3, 7, 3, 6, 9, 5, 0, 0, 5, 4, 5, 6, 4, 6, 3, 4, 2, 7, 1, 7, 8, 1]
        ),
        // 39
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-25,   5),
                    FixVec(-30,   20),
                    FixVec(-25,   30),
                    FixVec(-10,   25),
                    FixVec(  0,   30),
                    FixVec( 15,   15),
                    FixVec( 30,   15),
                    FixVec( 35,    5),
                    FixVec( 30,  -10),
                    FixVec( 25,  -10),
                    FixVec( 15,  -20),
                    FixVec( 15,  -30),
                    FixVec( -5,  -35),
                    FixVec(-15,  -20),
                    FixVec(-40,  -25),
                    FixVec(-35,   -5)
                ],
                [
                    FixVec(  5,    0),
                    FixVec( 10,  -10),
                    FixVec( 25,    0),
                    FixVec( 15,    5)
                ],
                [
                    FixVec(-15,    0),
                    FixVec(-25,   -5),
                    FixVec(-30,  -15),
                    FixVec(-15,  -10),
                    FixVec( -5,  -15),
                    FixVec(  0,  -25),
                    FixVec(  5,  -15),
                    FixVec( -5,   -5),
                    FixVec( -5,    5),
                    FixVec(  5,   10),
                    FixVec(  0,   20),
                    FixVec( -5,   15),
                    FixVec(-10,   15),
                    FixVec(-15,   20),
                    FixVec(-20,   10),
                    FixVec(-15,    5)
                ]
            ]),
            points: [FixVec(-40, -25), FixVec(-35, -5), FixVec(-25, 5), FixVec(-30, 20), FixVec(-25, 30), FixVec(-10, 25), FixVec(0, 30), FixVec(15, 15), FixVec(30, 15), FixVec(35, 5), FixVec(30, -10), FixVec(25, -10), FixVec(15, -20), FixVec(15, -30), FixVec(-5, -35), FixVec(-15, -20), FixVec(-15, -10), FixVec(-5, -15), FixVec(0, -25), FixVec(5, -15), FixVec(-5, -5), FixVec(-5, 5), FixVec(5, 10), FixVec(0, 20), FixVec(-5, 15), FixVec(-10, 15), FixVec(-15, 20), FixVec(-20, 10), FixVec(-15, 5), FixVec(-15, 0), FixVec(-25, -5), FixVec(-30, -15), FixVec(5, 0), FixVec(10, -10), FixVec(25, 0), FixVec(15, 5)]
            ,
            indices: [1, 31, 0, 0, 31, 15, 31, 16, 15, 15, 16, 17, 18, 15, 17, 18, 14, 15, 12, 19, 33, 32, 33, 19, 12, 18, 19, 13, 18, 12, 13, 14, 18, 12, 33, 11, 33, 34, 11, 11, 34, 10, 31, 1, 30, 1, 2, 30, 27, 2, 3, 2, 27, 28, 26, 27, 3, 26, 4, 5, 26, 5, 25, 25, 5, 24, 24, 5, 23, 5, 6, 23, 7, 23, 6, 22, 23, 7, 22, 7, 35, 35, 7, 8, 35, 8, 34, 34, 8, 9, 34, 9, 10, 26, 3, 4, 29, 30, 2, 2, 28, 29, 20, 21, 32, 20, 32, 19, 21, 22, 32, 32, 22, 35]
        ),
        // 40
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec( -5,   10),
                    FixVec(  5,   10),
                    FixVec( 10,    5),
                    FixVec( 10,   -5),
                    FixVec(  5,  -10),
                    FixVec( -5,  -10),
                    FixVec(-10,   -5),
                    FixVec(-10,    5)
                ],
                [
                    FixVec( -5,    0),
                    FixVec(  0,   -5),
                    FixVec(  5,    0),
                    FixVec(  0,    5)
                ]
            ]),
            points: [FixVec(-10, -5), FixVec(-10, 5), FixVec(-5, 10), FixVec(5, 10), FixVec(10, 5), FixVec(10, -5), FixVec(5, -10), FixVec(-5, -10), FixVec(-5, 0), FixVec(0, -5), FixVec(5, 0), FixVec(0, 5)]
            ,
            indices: [0, 1, 8, 0, 8, 7, 1, 2, 8, 8, 2, 11, 11, 2, 3, 11, 3, 10, 8, 9, 7, 7, 9, 6, 9, 10, 6, 4, 10, 3, 10, 5, 6, 4, 5, 10]
        ),
        // 41
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-10,  -10),
                    FixVec(-10,   10),
                    FixVec( 10,   10),
                    FixVec( 10,  -10)
                ],
                [
                    FixVec(  0,   -5),
                    FixVec(  5,   -5),
                    FixVec(  5,    5),
                    FixVec(  0,    5)
                ],
                [
                    FixVec( -5,   -5),
                    FixVec(  0,   -5),
                    FixVec(  0,    5),
                    FixVec( -5,    5)
                ]
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(10, 10), FixVec(10, -10), FixVec(5, -5), FixVec(5, 5), FixVec(-5, 5), FixVec(-5, -5)]
            ,
            indices: [0, 1, 7, 7, 1, 6, 6, 1, 5, 1, 2, 5, 7, 4, 0, 0, 4, 3, 4, 5, 3, 5, 2, 3]
        ),
        // 42
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec.float(  0,    0),
                FixVec.float( -5,    5),
                FixVec.float( -5,   10),
                FixVec.float(  5,   10),
                FixVec.float(  5,    5),
                FixVec.float(  0,    0),
                FixVec.float(  5,   -5),
                FixVec.float(  5,  -10),
                FixVec.float( -5,  -10),
                FixVec.float( -5,   -5)
            ]),
            points: [FixVec(-5120, -10240), FixVec(-5120, -5120), FixVec(0, 0), FixVec(5120, -5120), FixVec(5120, -10240), FixVec(-5120, 5120), FixVec(-5120, 10240), FixVec(5120, 10240), FixVec(5120, 5120), FixVec(0, 0)]
            ,
            indices: [3, 1, 2, 1, 4, 0, 3, 4, 1, 5, 6, 8, 5, 8, 9, 6, 7, 8]
        ),
        // 43
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-15,  -10),
                    FixVec(-15,   10),
                    FixVec( 15,   10),
                    FixVec( 15,  -10)
                ],
                [
                    FixVec(-10,    0),
                    FixVec( -5,   -5),
                    FixVec(  0,    0),
                    FixVec( -5,    5)
                ],
                [
                    FixVec(  0,    0),
                    FixVec(  5,   -5),
                    FixVec( 10,    0),
                    FixVec(  5,    5)
                ]
            ]),
            points: [FixVec(-15, -10), FixVec(-15, 10), FixVec(15, 10), FixVec(15, -10), FixVec(-10, 0), FixVec(-5, -5), FixVec(0, 0), FixVec(5, -5), FixVec(10, 0), FixVec(5, 5), FixVec(0, 0), FixVec(-5, 5)]
            ,
            indices: [0, 1, 4, 4, 1, 11, 10, 11, 9, 11, 1, 9, 1, 2, 9, 9, 2, 8, 4, 5, 0, 6, 7, 5, 5, 7, 0, 0, 7, 3, 7, 8, 3, 8, 2, 3]
        ),
        // 44
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-10,   15),
                    FixVec( 10,   15),
                    FixVec( 10,  -15),
                    FixVec(-10,  -15)
                ],
                [
                    FixVec( -5,    5),
                    FixVec(  0,    0),
                    FixVec(  5,    5),
                    FixVec(  0,   10)
                ],
                [
                    FixVec( -5,   -5),
                    FixVec(  0,  -10),
                    FixVec(  5,   -5),
                    FixVec(  0,    0)
                ]
            ]),
            points: [FixVec(-10, -15), FixVec(-10, 15), FixVec(10, 15), FixVec(10, -15), FixVec(-5, -5), FixVec(0, -10), FixVec(5, -5), FixVec(0, 0), FixVec(5, 5), FixVec(0, 10), FixVec(-5, 5), FixVec(0, 0)]
            ,
            indices: [0, 1, 4, 4, 1, 10, 10, 1, 9, 1, 2, 9, 9, 2, 8, 4, 5, 0, 0, 5, 3, 5, 6, 3, 6, 8, 3, 8, 2, 3, 4, 10, 11, 7, 8, 6]
        ),
        // 45
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-10,   10),
                    FixVec( -5,   10),
                    FixVec(  0,    5),
                    FixVec(  5,   10),
                    FixVec( 10,   10),
                    FixVec( 10,  -10),
                    FixVec(-10,  -10)
                ],
                [
                    FixVec( -5,    0),
                    FixVec(  0,   -5),
                    FixVec(  5,    0),
                    FixVec(  0,    5)
                ]
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(-5, 10), FixVec(0, 5), FixVec(-5, 0), FixVec(0, -5), FixVec(5, 0), FixVec(0, 5), FixVec(5, 10), FixVec(10, 10), FixVec(10, -10)]
            ,
            indices: [0, 1, 4, 1, 2, 4, 4, 2, 3, 4, 5, 0, 0, 5, 10, 5, 6, 10, 6, 8, 9, 6, 9, 10, 7, 8, 6]
        ),
        // 46
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-10,   10),
                    FixVec( 10,   10),
                    FixVec( 10,  -10),
                    FixVec(  5,  -10),
                    FixVec(  0,   -5),
                    FixVec( -5,  -10),
                    FixVec(-10,  -10)
                ],
                [
                    FixVec( -5,    0),
                    FixVec(  0,   -5),
                    FixVec(  5,    0),
                    FixVec(  0,    5)
                ]
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(10, 10), FixVec(10, -10), FixVec(5, -10), FixVec(0, -5), FixVec(5, 0), FixVec(0, 5), FixVec(-5, 0), FixVec(0, -5), FixVec(-5, -10)]
            ,
            indices: [0, 1, 8, 0, 8, 10, 8, 1, 7, 1, 2, 7, 7, 2, 6, 10, 8, 9, 5, 6, 4, 4, 6, 3, 6, 2, 3]
        ),
        // 47
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-10,   10),
                    FixVec( -5,   10),
                    FixVec(  0,    5),
                    FixVec(  5,   10),
                    FixVec( 10,   10),
                    FixVec( 10,  -10),
                    FixVec(  5,  -10),
                    FixVec(  0,   -5),
                    FixVec( -5,  -10),
                    FixVec(-10,  -10)
                ],
                [
                    FixVec( -5,    0),
                    FixVec(  0,   -5),
                    FixVec(  5,    0),
                    FixVec(  0,    5)
                ]
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(-5, 10), FixVec(0, 5), FixVec(-5, 0), FixVec(0, -5), FixVec(-5, -10), FixVec(5, 0), FixVec(0, 5), FixVec(5, 10), FixVec(10, 10), FixVec(10, -10), FixVec(5, -10), FixVec(0, -5)]
            ,
            indices: [0, 1, 4, 0, 4, 6, 1, 2, 4, 4, 2, 3, 6, 4, 5, 13, 7, 12, 10, 7, 9, 7, 11, 12, 10, 11, 7, 8, 9, 7]
        ),
        // 48
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   10),
                FixVec( 10,   10),
                FixVec(  0,    5),
                FixVec(  5,    0),
                FixVec( 10,   10),
                FixVec( 10,  -10),
                FixVec(-10,  -10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(10, 10), FixVec(0, 5), FixVec(5, 0), FixVec(10, 10), FixVec(10, -10)]
            ,
            indices: [0, 1, 3, 1, 2, 3, 3, 4, 0, 0, 4, 6, 4, 5, 6]
        ),
        // 49
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec( 10,   10),
                FixVec( 10,  -10),
                FixVec(  5,    0),
                FixVec(  0,   -5),
                FixVec( 10,  -10),
                FixVec(-10,  -10),
                FixVec(-10,   10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(10, 10), FixVec(10, -10), FixVec(5, 0), FixVec(0, -5), FixVec(10, -10)]
            ,
            indices: [0, 1, 5, 5, 1, 4, 1, 2, 4, 4, 2, 3, 0, 5, 6]
        ),
        // 50
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec( 10,   10),
                FixVec( 10,  -10),
                FixVec(-10,  -10),
                FixVec(  0,   -5),
                FixVec( -5,    0),
                FixVec(-10,  -10),
                FixVec(-10,   10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(10, 10), FixVec(10, -10), FixVec(-10, -10), FixVec(0, -5), FixVec(-5, 0)]
            ,
            indices: [0, 1, 6, 6, 1, 2, 6, 2, 5, 4, 5, 3, 5, 2, 3]
        ),
        // 51
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec(-10,   10),
                FixVec( -5,    0),
                FixVec(  0,    5),
                FixVec(-10,   10),
                FixVec( 10,   10),
                FixVec( 10,  -10),
                FixVec(-10,  -10)
            ]),
            points: [FixVec(-10, -10), FixVec(-10, 10), FixVec(-5, 0), FixVec(0, 5), FixVec(-10, 10), FixVec(10, 10), FixVec(10, -10)]
            ,
            indices: [1, 2, 0, 2, 3, 6, 2, 6, 0, 3, 5, 6, 4, 5, 3]
        ),
        // 52
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec.float(10.0,   10.0),
                FixVec.float(10.0,   -5.0),
                FixVec.float( 1.0,    0.0),
                FixVec.float( 5.0,   -5.0),
                FixVec.float( 3.0,   -5.0),
                FixVec.float( 5.0,  -10.0),
                FixVec.float(-10.0, -10.0)
            ]),
            points: [FixVec(10240, 10240), FixVec(10240, -5120), FixVec(1024, 0), FixVec(5120, -5120), FixVec(3072, -5120), FixVec(5120, -10240), FixVec(-10240, -10240)]
            ,
            indices: [6, 0, 2, 2, 0, 1, 2, 4, 6, 6, 4, 5, 2, 3, 4]
        ),
        // 53
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec.float(10.0,   8.0),
                FixVec.float(15.0,  -1.0),
                FixVec.float( 6.0,   3.0),
                FixVec.float(10.0,   0.0),
                FixVec.float( 8.0,   0.0),
                FixVec.float( 9.0,  -2.0),
                FixVec.float(-5.0,  -2.0),
            ]),
            points: [FixVec(10240, 8192), FixVec(15360, -1024), FixVec(6144, 3072), FixVec(10240, 0), FixVec(8192, 0), FixVec(9216, -2048), FixVec(-5120, -2048)]
            ,
            indices: [6, 0, 2, 2, 0, 1, 2, 4, 6, 6, 4, 5, 2, 3, 4]
        ),
        // 54
        TriangulationTest(
            shape: FixShape(contour: [
                FixVec.float(10.6,   8.3),
                FixVec.float( 9.8,   5.4),
                FixVec.float(14.2,   3.4),
                FixVec.float(13.0,     0),
                FixVec.float(14.2,   1.2),
                FixVec.float(15.2,  -1.2),
                FixVec.float( 6.2,   2.4),
                FixVec.float(10.6,  -0.5),
                FixVec.float( 7.9,   1.0),
                FixVec.float( 8.6,  -2.0),
                FixVec.float( 4.2,  -1.7),
                FixVec.float( 4.2,  -5.1),
                FixVec.float(-0.9,  -5.6),
                FixVec.float( 0.0,  -3.9),
                FixVec.float(-3.6,  -4.2),
                FixVec.float(-2.1,  -1.5),
                FixVec.float(-5.0,  -1.7),
                FixVec.float(-2.8,  -0.3),
                FixVec.float(-3.6,   2.0),
                FixVec.float(-10.7,  4.2),
                FixVec.float(-11.9,  1.0),
                FixVec.float(-14.1,  3.9),
                FixVec.float(-11.4,  3.4),
                FixVec.float(-10.9,  6.6),
                FixVec.float(-6.3,   7.3),
                FixVec.float(-1.2,   3.7),
                FixVec.float( 8.1,   4.2)
            ]),
            points: [FixVec(-11673, 3481), FixVec(-11161, 6758), FixVec(-6451, 7475), FixVec(-1228, 3788), FixVec(8294, 4300), FixVec(10854, 8499), FixVec(10035, 5529), FixVec(14540, 3481), FixVec(13312, 0), FixVec(14540, 1228), FixVec(15564, -1228), FixVec(6348, 2457), FixVec(10854, -512), FixVec(8089, 1024), FixVec(8806, -2048), FixVec(4300, -1740), FixVec(4300, -5222), FixVec(-921, -5734), FixVec(0, -3993), FixVec(-3686, -4300), FixVec(-2150, -1536), FixVec(-5120, -1740), FixVec(-2867, -307), FixVec(-3686, 2048), FixVec(-10956, 4300), FixVec(-12185, 1024), FixVec(-14438, 3993)]
            ,
            indices: [26, 0, 25, 25, 0, 24, 0, 1, 24, 1, 2, 24, 24, 2, 23, 22, 23, 3, 2, 3, 23, 22, 3, 20, 21, 22, 20, 19, 20, 18, 15, 20, 3, 15, 18, 20, 18, 15, 16, 15, 3, 11, 3, 4, 11, 4, 6, 8, 4, 8, 11, 11, 8, 10, 8, 9, 10, 17, 18, 16, 11, 13, 15, 15, 13, 14, 11, 12, 13, 4, 5, 6, 6, 7, 8]
        ),
        // 55
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-30,    0),
                    FixVec(-30,   30),
                    FixVec(  0,   30),
                    FixVec( 30,   30),
                    FixVec( 15,    0),
                    FixVec( 30,  -30),
                    FixVec(  0,  -30),
                    FixVec(-30,  -30)
                ],
                [
                    FixVec(-15,  -15),
                    FixVec( 18,  -15),
                    FixVec( 10,   15),
                    FixVec(-15,   15)
                ]
            ]),
            points: [FixVec(-30, -30), FixVec(-30, 30), FixVec(30, 30), FixVec(15, 0), FixVec(30, -30), FixVec(18, -15), FixVec(10, 15), FixVec(-15, 15), FixVec(-15, -15)]
            ,
            indices: [0, 1, 8, 8, 1, 7, 7, 1, 6, 1, 2, 6, 6, 2, 3, 8, 5, 4, 8, 4, 0, 6, 3, 5, 3, 4, 5]
        ),
        // 56
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-15,    0),
                    FixVec(-30,   30),
                    FixVec( 30,   30),
                    FixVec( 30,  -30),
                    FixVec(  0,  -30),
                    FixVec(-30,  -30)
                ],
                [
                    FixVec( 10,   -8),
                    FixVec(-10,  -13),
                    FixVec( 19,  -11),
                    FixVec(-12,   15),
                    FixVec( 19,   18),
                    FixVec(-20,   18)
                ]
            ]),
            points: [FixVec(-30, -30), FixVec(-15, 0), FixVec(-30, 30), FixVec(30, 30), FixVec(30, -30), FixVec(-20, 18), FixVec(10, -8), FixVec(-10, -13), FixVec(19, -11), FixVec(-12, 15), FixVec(19, 18)]
            ,
            indices: [1, 7, 0, 7, 8, 4, 7, 4, 0, 8, 10, 3, 8, 3, 4, 5, 2, 10, 2, 3, 10, 2, 5, 1, 1, 5, 6, 1, 6, 7, 9, 10, 8]
        ),
        // 57
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-15,    0),
                    FixVec(-30,   30),
                    FixVec(  0,   15),
                    FixVec( 30,   30),
                    FixVec( 15,    0),
                    FixVec( 30,  -30),
                    FixVec(  0,  -15),
                    FixVec(-30,  -30)
                ],
                [
                    FixVec(-10,    0),
                    FixVec(  0,  -10),
                    FixVec( 10,    0),
                    FixVec(  0,   10)
                ]
            ]),
            points: [FixVec(-30, -30), FixVec(-15, 0), FixVec(-30, 30), FixVec(0, 15), FixVec(30, 30), FixVec(15, 0), FixVec(30, -30), FixVec(0, -15), FixVec(-10, 0), FixVec(0, -10), FixVec(10, 0), FixVec(0, 10)]
            ,
            indices: [1, 8, 7, 1, 7, 0, 8, 9, 7, 9, 10, 7, 10, 5, 7, 7, 5, 6, 3, 1, 2, 1, 11, 8, 3, 11, 1, 11, 3, 10, 10, 3, 5, 3, 4, 5]
        ),
        // 58
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec(-15,    0),
                    FixVec(-30,   30),
                    FixVec(  0,   15),
                    FixVec( 30,   30),
                    FixVec( 15,    0),
                    FixVec( 30,  -30),
                    FixVec(  0,  -15),
                    FixVec(-30,  -30)
                ],
                [
                    FixVec(-10,    0),
                    FixVec(-20,  -20),
                    FixVec(  0,  -10),
                    FixVec( 20,  -20),
                    FixVec( 10,    0),
                    FixVec( 20,   20),
                    FixVec(  0,   10),
                    FixVec(-20,   20)
                ]
            ]),
            points: [FixVec(-30, -30), FixVec(-15, 0), FixVec(-30, 30), FixVec(0, 15), FixVec(30, 30), FixVec(15, 0), FixVec(30, -30), FixVec(0, -15), FixVec(0, -10), FixVec(20, -20), FixVec(10, 0), FixVec(20, 20), FixVec(0, 10), FixVec(-20, 20), FixVec(-10, 0), FixVec(-20, -20)]
            ,
            indices: [0, 1, 15, 15, 1, 14, 13, 2, 3, 13, 3, 12, 12, 3, 11, 3, 4, 11, 0, 15, 7, 15, 8, 7, 8, 9, 7, 7, 9, 6, 2, 13, 1, 13, 14, 1, 10, 11, 5, 5, 11, 4, 10, 5, 9, 5, 6, 9]
        ),
        // 59
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec.float(32.0,  0.0),                  // 0
                    FixVec.float(21.02803,  -4.182736),
                    FixVec.float(29.56414,  -12.24587),
                    FixVec.float(35.38735,  -23.64507),
                    FixVec.float(22.62741,  -22.62741),
                    FixVec.float(11.91142,  -17.82671),    // 5
                    FixVec.float(12.24587,  -29.56414),
                    FixVec.float(8.303045,  -41.74222),
                    FixVec.float(     0.0,      -32.0),
                    FixVec.float(-4.182734,  -21.02804),
                    FixVec.float(-12.24586,  -29.56413),   // 10
                    FixVec.float(-23.64507,  -35.38735),
                    FixVec.float(-22.62742,  -22.62742),
                    FixVec.float(-17.82671,  -11.91142),
                    FixVec.float(-29.56416,  -12.24587),
                    FixVec.float(-41.74223,  -8.303034),   // 15
                    FixVec.float(    -32.0,        0.0),
                    FixVec.float(-21.02803,  4.182745),    // 17
                    FixVec.float(-29.56418,  12.2459),
                    FixVec.float(-35.38733,  23.64509),
                    FixVec.float(-22.62736,  22.62739),    // 20
                    FixVec.float(-11.91141,  17.82672),    // 21
                    FixVec.float(-12.24587,  29.56422),
                    FixVec.float(-8.303008,  41.74223),
                    FixVec.float(      0.0,      32.0),
                    FixVec.float(4.182758,  21.02803),     // 25
                    FixVec.float(12.24594,  29.56422),
                    FixVec.float(23.64511,  35.38732),
                    FixVec.float(22.62737,  22.62731),
                    FixVec.float(17.82672,  11.9114),
                    FixVec.float(29.56428,  12.24587),     // 30
                    FixVec.float(41.74223,  8.30298)
                ],
                [
                    FixVec.float(20.87112,  4.15149),
                    FixVec.float(14.78214,  6.122937),
                    FixVec.float(8.913362,  5.9557),
                    FixVec.float(11.31368,  11.31366),     // 35
                    FixVec.float(11.82256,  17.69366),
                    FixVec.float( 6.12297,  14.78211),
                    FixVec.float(2.091379,  10.51402),
                    FixVec.float(      0.0,      16.0),
                    FixVec.float(-4.151504,  20.87111),    // 40
                    FixVec.float(-6.122936,  14.78211),
                    FixVec.float(-5.955706,  8.913358),
                    FixVec.float(-11.31368,   11.3137),     // 43
                    FixVec.float(-17.69367,  11.82255),
                    FixVec.float(-14.78209,   6.12295),     // 45
                    FixVec.float(-10.51402,  2.091372),
                    FixVec.float(    -16.0,       0.0),
                    FixVec.float(-20.87111,  -4.151517),   // 48
                    FixVec.float(-14.78208,  -6.122935),
                    FixVec.float(-8.913354,  -5.955712),
                    FixVec.float(-11.31371,  -11.31371),
                    FixVec.float(-11.82253,  -17.69367),
                    FixVec.float(-6.12293,   -14.78207),
                    FixVec.float(-2.091367,  -10.51402),
                    FixVec.float(      0.0,      -16.0),
                    FixVec.float(4.151523,  -20.87111),
                    FixVec.float(6.122935,  -14.78207),
                    FixVec.float(5.955712,  -8.913354),
                    FixVec.float(11.31371,  -11.31371),
                    FixVec.float(17.69367,  -11.82254),
                    FixVec.float(14.78207,  -6.122935),
                    FixVec.float(10.51402,  -2.091368),
                    FixVec.float(    16.0,        0.0)
                ]
            ]),
            points: [FixVec(-42744, -8502), FixVec(-32768, 0), FixVec(-21532, 4283), FixVec(-30273, 12539), FixVec(-36236, 24212), FixVec(-23170, 23170), FixVec(-12197, 18254), FixVec(-12539, 30273), FixVec(-8502, 42744), FixVec(0, 32768), FixVec(4283, 21532), FixVec(12539, 30273), FixVec(24212, 36236), FixVec(23170, 23170), FixVec(18254, 12197), FixVec(30273, 12539), FixVec(42744, 8502), FixVec(32768, 0), FixVec(21532, -4283), FixVec(30273, -12539), FixVec(36236, -24212), FixVec(23170, -23170), FixVec(12197, -18254), FixVec(12539, -30273), FixVec(8502, -42744), FixVec(0, -32768), FixVec(-4283, -21532), FixVec(-12539, -30273), FixVec(-24212, -36236), FixVec(-23170, -23170), FixVec(-18254, -12197), FixVec(-30273, -12539), FixVec(-15136, -6269), FixVec(-9127, -6098), FixVec(-11585, -11585), FixVec(-12106, -18118), FixVec(-6269, -15136), FixVec(-2141, -10766), FixVec(0, -16384), FixVec(4251, -21372), FixVec(6269, -15136), FixVec(6098, -9127), FixVec(11585, -11585), FixVec(18118, -12106), FixVec(15136, -6269), FixVec(10766, -2141), FixVec(16384, 0), FixVec(21372, 4251), FixVec(15136, 6269), FixVec(9127, 6098), FixVec(11585, 11585), FixVec(12106, 18118), FixVec(6269, 15136), FixVec(2141, 10766), FixVec(0, 16384), FixVec(-4251, 21372), FixVec(-6269, 15136), FixVec(-6098, 9127), FixVec(-11585, 11585), FixVec(-18118, 12106), FixVec(-15136, 6269), FixVec(-10766, 2141), FixVec(-16384, 0), FixVec(-21372, -4251)]
            ,
            indices: [0, 1, 31, 1, 2, 63, 1, 63, 31, 31, 63, 30, 63, 32, 30, 4, 5, 3, 59, 3, 5, 60, 2, 59, 59, 2, 3, 5, 6, 59, 59, 6, 58, 35, 29, 30, 34, 30, 32, 29, 27, 28, 35, 27, 29, 34, 35, 30, 32, 33, 34, 2, 62, 63, 60, 62, 2, 62, 60, 61, 9, 7, 8, 55, 6, 7, 56, 58, 6, 58, 56, 57, 35, 36, 26, 35, 26, 27, 38, 36, 37, 38, 26, 36, 39, 26, 38, 39, 25, 26, 23, 25, 39, 39, 40, 22, 55, 56, 6, 9, 55, 7, 10, 55, 9, 10, 54, 55, 52, 54, 10, 52, 53, 54, 52, 10, 51, 10, 11, 51, 40, 41, 42, 22, 40, 42, 39, 22, 23, 23, 24, 25, 49, 50, 48, 50, 51, 14, 13, 51, 11, 50, 14, 48, 13, 14, 51, 11, 12, 13, 45, 46, 44, 44, 46, 18, 46, 47, 18, 42, 43, 22, 44, 18, 43, 22, 43, 21, 43, 18, 19, 43, 19, 21, 21, 19, 20, 48, 14, 47, 14, 15, 47, 47, 15, 17, 47, 17, 18, 15, 16, 17]
        ),
        // 60
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec.float(    32.0,        0.0),    // 0
                    FixVec.float(16.63412,  -3.308732),    // 1
                    FixVec.float(29.56414,  -12.24587),    // 2
                    FixVec.float(39.11233,  -26.13403),    // 3
                    FixVec.float(22.62741,  -22.62741),    // 4
                    FixVec.float(9.42247,  -14.10172),     // 5
                    FixVec.float(12.24587,  -29.56414),    // 6
                    FixVec.float(9.177051,  -46.13614),    // 7
                    FixVec.float(     0.0,      -32.0),    // 8
                    FixVec.float(-3.30873,  -16.63412),    // 9
                    FixVec.float(-12.24586,  -29.56413),   // 10
                    FixVec.float(-26.13402,  -39.11234),   // 11
                    FixVec.float(-22.62742,  -22.62742),   // 12
                    FixVec.float(-14.10172,  -9.42247),    // 13
                    FixVec.float(-29.56417,  -12.24587),   // 14
                    FixVec.float(-46.13614,  -9.177038),   // 15
                    FixVec.float(    -32.0,        0.0),   // 16
                    FixVec.float(-16.63412,  3.308738),    // 17
                    FixVec.float(-29.56419,  12.24591),    // 18
                    FixVec.float(-39.11232,  26.13405),    // 19
                    FixVec.float(-22.62735,  22.62738),    // 20
                    FixVec.float(-9.422461,  14.10173),    // 21
                    FixVec.float(-12.24588,  29.56424),    // 22
                    FixVec.float(-9.177009,  46.13615),    // 23
                    FixVec.float(      0.0,      32.0),    // 24
                    FixVec.float(3.308749,  16.63411),     // 25
                    FixVec.float(12.24596,  29.56426),     // 26
                    FixVec.float(26.13407,  39.1123),      // 27
                    FixVec.float(22.62734,  22.62728),     // 28
                    FixVec.float(14.10174,  9.422452),     // 29
                    FixVec.float(29.56433,  12.24589),     // 30
                    FixVec.float(46.13615,  9.176978)      // 31
                ],
                [
                    FixVec.float(23.06808,  4.588489),     // 32
                    FixVec.float(14.78216,  6.122947),     // 33
                    FixVec.float(7.050869,  4.711226),     // 34
                    FixVec.float(11.31367,  11.31364),     // 35
                    FixVec.float(13.06704,  19.55615),     // 36
                    FixVec.float(6.122978,  14.78213),     // 37
                    FixVec.float(1.654375,  8.317057),     // 38
                    FixVec.float(     0.0,      16.0),     // 39
                    FixVec.float(-4.588504,  23.06807),    // 40
                    FixVec.float(-6.122941,  14.78212),    // 41
                    FixVec.float(-4.71123,  7.050865),     // 42
                    FixVec.float(-11.31367,  11.31369),    // 43
                    FixVec.float(-19.55616,  13.06702),    // 44
                    FixVec.float(-14.7821,  6.122953),     // 45
                    FixVec.float(-8.317058,  1.654369),    // 46
                    FixVec.float(    -16.0,        0.0),   // 47
                    FixVec.float(-23.06807,  -4.588519),   // 48
                    FixVec.float(-14.78208,  -6.122936),   // 49
                    FixVec.float(-7.050862,  -4.711235),   // 50
                    FixVec.float(-11.31371,  -11.31371),   // 51
                    FixVec.float(-13.06701,  -19.55617),   // 52
                    FixVec.float(-6.122929,  -14.78206),   // 53
                    FixVec.float(-1.654365,  -8.317059),   // 54
                    FixVec.float(     0.0,      -16.0),    // 55
                    FixVec.float(4.588525,  -23.06807),    // 56
                    FixVec.float(6.122935,  -14.78207),    // 57
                    FixVec.float(4.711235,  -7.050862),    // 58
                    FixVec.float(11.31371,  -11.31371),    // 59
                    FixVec.float(19.55617,  -13.06701),    // 60
                    FixVec.float(14.78207,  -6.122935),    // 61
                    FixVec.float(8.317059,  -1.654366),    // 62
                    FixVec.float(    16.0,        0.0)     // 63
                ]
            ]),
            points: [FixVec(-47243, -9397), FixVec(-32768, 0), FixVec(-17033, 3388), FixVec(-30273, 12539), FixVec(-40051, 26761), FixVec(-23170, 23170), FixVec(-9648, 14440), FixVec(-12539, 30273), FixVec(-9397, 47243), FixVec(0, 32768), FixVec(3388, 17033), FixVec(12539, 30273), FixVec(26761, 40050), FixVec(23170, 23170), FixVec(14440, 9648), FixVec(30273, 12539), FixVec(47243, 9397), FixVec(32768, 0), FixVec(17033, -3388), FixVec(30273, -12539), FixVec(40051, -26761), FixVec(23170, -23170), FixVec(9648, -14440), FixVec(12539, -30273), FixVec(9397, -47243), FixVec(0, -32768), FixVec(-3388, -17033), FixVec(-12539, -30273), FixVec(-26761, -40051), FixVec(-23170, -23170), FixVec(-14440, -9648), FixVec(-30273, -12539), FixVec(-15136, -6269), FixVec(-7220, -4824), FixVec(-11585, -11585), FixVec(-13380, -20025), FixVec(-6269, -15136), FixVec(-1694, -8516), FixVec(0, -16384), FixVec(4698, -23621), FixVec(6269, -15136), FixVec(4824, -7220), FixVec(11585, -11585), FixVec(20025, -13380), FixVec(15136, -6269), FixVec(8516, -1694), FixVec(16384, 0), FixVec(23621, 4698), FixVec(15136, 6269), FixVec(7220, 4824), FixVec(11585, 11585), FixVec(13380, 20025), FixVec(6269, 15136), FixVec(1694, 8516), FixVec(0, 16384), FixVec(-4698, 23621), FixVec(-6269, 15136), FixVec(-4824, 7220), FixVec(-11585, 11585), FixVec(-20025, 13380), FixVec(-15136, 6269), FixVec(-8516, 1694), FixVec(-16384, 0), FixVec(-23621, -4698)]
            ,
            indices: [0, 1, 31, 31, 1, 63, 1, 2, 63, 63, 2, 62, 4, 5, 3, 5, 59, 3, 3, 59, 2, 59, 60, 2, 2, 60, 61, 2, 61, 62, 29, 30, 35, 27, 29, 35, 27, 28, 29, 35, 36, 26, 35, 26, 27, 36, 37, 26, 26, 37, 38, 39, 26, 38, 39, 25, 26, 25, 39, 23, 39, 40, 22, 63, 32, 30, 63, 30, 31, 35, 30, 34, 30, 32, 33, 30, 33, 34, 59, 5, 6, 59, 6, 58, 6, 7, 55, 6, 56, 57, 6, 57, 58, 9, 7, 8, 6, 55, 56, 9, 55, 7, 10, 55, 9, 10, 54, 55, 54, 10, 53, 53, 10, 52, 10, 11, 51, 10, 51, 52, 51, 11, 13, 51, 13, 14, 11, 12, 13, 23, 39, 22, 40, 41, 22, 41, 42, 22, 42, 43, 22, 22, 43, 21, 51, 14, 50, 50, 14, 49, 49, 14, 48, 48, 14, 47, 14, 15, 47, 45, 46, 18, 45, 18, 44, 44, 18, 43, 43, 18, 19, 43, 19, 21, 21, 19, 20, 25, 23, 24, 46, 47, 18, 47, 15, 17, 47, 17, 18, 15, 16, 17]
        ),
        // 61
        TriangulationTest(
            shape: FixShape(paths: [
                [
                    FixVec.float(0.0,  -18.0),
                    FixVec.float(-2.8,  -19.6),
                    FixVec.float(-4.8,  -19.6),
                    FixVec.float(-3.6,  -17.6),
                    FixVec.float(-6.4,  -18.0),
                    FixVec.float(-9.2,  -16.8),
                    FixVec.float(-7.6,  -15.2),
                    FixVec.float(-10.4,  -15.6),
                    FixVec.float(-12.8,  -13.6),
                    FixVec.float(-10.4,  -12.8),
                    FixVec.float(-13.6,  -12.4),
                    FixVec.float(-15.2,  -10.8),
                    FixVec.float(-14.0,  -10.0),
                    FixVec.float(-16.0,  -9.6),
                    FixVec.float(-17.2,  -7.2),
                    FixVec.float(-12.8,  -6.8),
                    FixVec.float(-7.2,  -4.0),
                    FixVec.float(-7.6,  -1.2),
                    FixVec.float(-8.4,  0.8),
                    FixVec.float(-8.8,  -0.4),
                    FixVec.float(-10.0,  -1.2),
                    FixVec.float(-10.4,  1.2),
                    FixVec.float(-10.8,  0.0),
                    FixVec.float(-12.8,  -1.6),
                    FixVec.float(-12.8,  1.2),
                    FixVec.float(-13.6,  -0.4),
                    FixVec.float(-16.4,  -2.0),
                    FixVec.float(-16.0,  0.4),
                    FixVec.float(-18.4,  -1.2),
                    FixVec.float(-18.4,  1.2),
                    FixVec.float(-21.2,  -0.4),
                    FixVec.float(-20.8,  1.6),
                    FixVec.float(-23.6,  0.4),
                    FixVec.float(-23.2,  2.8),
                    FixVec.float(-26.0,  1.6),
                    FixVec.float(-25.2,  3.6),
                    FixVec.float(-29.2,  2.4),
                    FixVec.float(-28.4,  4.4),
                    FixVec.float(-32.4,  3.6),
                    FixVec.float(-31.0,  6.4),
                    FixVec.float(-35.2,  6.0),
                    FixVec.float(-34.0,  7.2),
                    FixVec.float(-37.6,  7.6),
                    FixVec.float(-35.6,  9.2),
                    FixVec.float(-38.4,  8.8),
                    FixVec.float(-41.2,  9.2),
                    FixVec.float(-39.2,  10.8),
                    FixVec.float(-42.0,  10.8),
                    FixVec.float(-44.8,  12.0),
                    FixVec.float(-41.2,  13.6),
                    FixVec.float(-45.2,  13.6),
                    FixVec.float(-47.6,  15.2),
                    FixVec.float(-42.8,  16.4),
                    FixVec.float(-46.8,  17.2),
                    FixVec.float(-48.8,  19.6),
                    FixVec.float(-44.0,  19.6),
                    FixVec.float(-40.8,  20.0),
                    FixVec.float(-42.8,  20.4),
                    FixVec.float(-46.0,  23.4),
                    FixVec.float(-48.0,  25.6),
                    FixVec.float(-42.0,  23.2),
                    FixVec.float(-36.8,  22.0),
                    FixVec.float(-38.4,  23.6),
                    FixVec.float(-39.6,  26.4),
                    FixVec.float(-39.6,  30.4),
                    FixVec.float(-37.6,  26.4),
                    FixVec.float(-28.0,  22.4),
                    FixVec.float(-30.0,  24.4),
                    FixVec.float(-30.0,  26.8),
                    FixVec.float(-28.4,  24.8),
                    FixVec.float(-21.2,  22.0),
                    FixVec.float(-11.0,  13.6),
                    FixVec.float(-8.4,  12.4),
                    FixVec.float(-6.0,  12.4),
                    FixVec.float(-4.0,  12.8),
                    FixVec.float(-2.4,  14.0),
                    FixVec.float(-0.0,  14.4),
                    FixVec.float(2.4,  14.0),
                    FixVec.float(4.0,  12.8),
                    FixVec.float(6.0,  12.4),
                    FixVec.float(8.4,  12.4),
                    FixVec.float(11.0,  13.6),
                    FixVec.float(21.2,  22.0),
                    FixVec.float(28.4,  24.8),
                    FixVec.float(30.0,  26.8),
                    FixVec.float(30.0,  24.4),
                    FixVec.float(28.0,  22.4),
                    FixVec.float(37.6,  26.4),
                    FixVec.float(39.6,  30.4),
                    FixVec.float(39.6,  26.4),
                    FixVec.float(38.4,  23.6),
                    FixVec.float(36.8,  22.0),
                    FixVec.float(42.0,  23.2),
                    FixVec.float(48.0,  25.6),
                    FixVec.float(46.0,  23.4),
                    FixVec.float(42.8,  20.4),
                    FixVec.float(40.8,  20.0),
                    FixVec.float(44.0,  19.6),
                    FixVec.float(48.8,  19.6),
                    FixVec.float(46.8,  17.2),
                    FixVec.float(42.8,  16.4),
                    FixVec.float(47.6,  15.2),
                    FixVec.float(45.2,  13.6),
                    FixVec.float(41.2,  13.6),
                    FixVec.float(44.8,  12.0),
                    FixVec.float(42.0,  10.8),
                    FixVec.float(39.2,  10.8),
                    FixVec.float(41.2,  9.2),
                    FixVec.float(38.4,  8.8),
                    FixVec.float(35.6,  9.2),
                    FixVec.float(37.6,  7.6),
                    FixVec.float(34.0,  7.2),
                    FixVec.float(35.2,  6.0),
                    FixVec.float(31.0,  6.4),
                    FixVec.float(32.4,  3.6),
                    FixVec.float(28.4,  4.4),
                    FixVec.float(29.2,  2.4),
                    FixVec.float(25.2,  3.6),
                    FixVec.float(26.0,  1.6),
                    FixVec.float(23.2,  2.8),
                    FixVec.float(23.6,  0.4),
                    FixVec.float(20.8,  1.6),
                    FixVec.float(21.2,  -0.4),
                    FixVec.float(18.4,  1.2),
                    FixVec.float(18.4,  -1.2),
                    FixVec.float(16.0,  0.4),
                    FixVec.float(16.4,  -2.0),
                    FixVec.float(13.6,  -0.4),
                    FixVec.float(12.8,  1.2),
                    FixVec.float(12.8,  -1.6),
                    FixVec.float(10.8,  0.0),
                    FixVec.float(10.4,  1.2),
                    FixVec.float(10.0,  -1.2),
                    FixVec.float(8.8,  -0.4),
                    FixVec.float(8.4,  0.8),
                    FixVec.float(7.6,  -1.2),
                    FixVec.float(7.2,  -4.0),
                    FixVec.float(12.8,  -6.8),
                    FixVec.float(17.2,  -7.2),
                    FixVec.float(16.0,  -9.6),
                    FixVec.float(14.0,  -10.0),
                    FixVec.float(15.2,  -10.8),
                    FixVec.float(13.6,  -12.4),
                    FixVec.float(10.4,  -12.8),
                    FixVec.float(12.8,  -13.6),
                    FixVec.float(10.4,  -15.6),
                    FixVec.float(7.6,  -15.2),
                    FixVec.float(9.2,  -16.8),
                    FixVec.float(6.4,  -18.0),
                    FixVec.float(3.6,  -17.6),
                    FixVec.float(4.8,  -19.6),
                    FixVec.float(2.8,  -19.6)
                ],
                
                [
                    FixVec.float(-2.4,  9.2),
                    FixVec.float(-2.4,  8.0),
                    FixVec.float(-1.6,  7.2),
                    FixVec.float(-1.2,  8.0)
                ],
                [
                    FixVec.float(1.2,  8.0),
                    FixVec.float(1.6,  7.2),
                    FixVec.float(2.4,  8.0),
                    FixVec.float(2.4,  9.2)
                ],
                [
                    FixVec.float(0.0,  8.0),
                    FixVec.float(-0.8,  7.6),
                    FixVec.float(-1.2,  6.8),
                    FixVec.float(-1.6,  6.4),
                    FixVec.float(-3.2,  6.4),
                    FixVec.float(-1.6,  5.6),
                    FixVec.float(-0.8,  4.8),
                    FixVec.float(0.0,  2.8),
                    FixVec.float(0.8,  4.8),
                    FixVec.float(1.6,  5.6),
                    FixVec.float(3.2,  6.4),
                    FixVec.float(1.6,  6.4),
                    FixVec.float(1.2,  6.8),
                    FixVec.float(0.8,  7.6),
                ],
            ]),
            points: [FixVec(-45056, 20070), FixVec(-41779, 20480), FixVec(-43827, 20889), FixVec(-47104, 23961), FixVec(-49152, 26214), FixVec(-43008, 23756), FixVec(-37683, 22528), FixVec(-39321, 24166), FixVec(-40550, 27033), FixVec(-40550, 31129), FixVec(-38502, 27033), FixVec(-28672, 22937), FixVec(-30720, 24985), FixVec(-30720, 27443), FixVec(-29081, 25395), FixVec(-21708, 22528), FixVec(-11264, 13926), FixVec(-8601, 12697), FixVec(-6144, 12697), FixVec(-4096, 13107), FixVec(-2457, 14336), FixVec(0, 14745), FixVec(2457, 14336), FixVec(4096, 13107), FixVec(6144, 12697), FixVec(8601, 12697), FixVec(11264, 13926), FixVec(21708, 22528), FixVec(29081, 25395), FixVec(30720, 27443), FixVec(30720, 24985), FixVec(28672, 22937), FixVec(38502, 27033), FixVec(40550, 31129), FixVec(40550, 27033), FixVec(39321, 24166), FixVec(37683, 22528), FixVec(43008, 23756), FixVec(49152, 26214), FixVec(47104, 23961), FixVec(43827, 20889), FixVec(41779, 20480), FixVec(45056, 20070), FixVec(49971, 20070), FixVec(47923, 17612), FixVec(43827, 16793), FixVec(48742, 15564), FixVec(46284, 13926), FixVec(42188, 13926), FixVec(45875, 12288), FixVec(43008, 11059), FixVec(40140, 11059), FixVec(42188, 9420), FixVec(39321, 9011), FixVec(36454, 9420), FixVec(38502, 7782), FixVec(34816, 7372), FixVec(36044, 6144), FixVec(31744, 6553), FixVec(33177, 3686), FixVec(29081, 4505), FixVec(29900, 2457), FixVec(25804, 3686), FixVec(26624, 1638), FixVec(23756, 2867), FixVec(24166, 409), FixVec(21299, 1638), FixVec(21708, -409), FixVec(18841, 1228), FixVec(18841, -1228), FixVec(16384, 409), FixVec(16793, -2048), FixVec(13926, -409), FixVec(13107, 1228), FixVec(13107, -1638), FixVec(11059, 0), FixVec(10649, 1228), FixVec(10240, -1228), FixVec(9011, -409), FixVec(8601, 819), FixVec(7782, -1228), FixVec(7372, -4096), FixVec(13107, -6963), FixVec(17612, -7372), FixVec(16384, -9830), FixVec(14336, -10240), FixVec(15564, -11059), FixVec(13926, -12697), FixVec(10649, -13107), FixVec(13107, -13926), FixVec(10649, -15974), FixVec(7782, -15564), FixVec(9420, -17203), FixVec(6553, -18432), FixVec(3686, -18022), FixVec(4915, -20070), FixVec(2867, -20070), FixVec(0, -18432), FixVec(-2867, -20070), FixVec(-4915, -20070), FixVec(-3686, -18022), FixVec(-6553, -18432), FixVec(-9420, -17203), FixVec(-7782, -15564), FixVec(-10649, -15974), FixVec(-13107, -13926), FixVec(-10649, -13107), FixVec(-13926, -12697), FixVec(-15564, -11059), FixVec(-14336, -10240), FixVec(-16384, -9830), FixVec(-17612, -7372), FixVec(-13107, -6963), FixVec(-7372, -4096), FixVec(-7782, -1228), FixVec(-8601, 819), FixVec(-9011, -409), FixVec(-10240, -1228), FixVec(-10649, 1228), FixVec(-11059, 0), FixVec(-13107, -1638), FixVec(-13107, 1228), FixVec(-13926, -409), FixVec(-16793, -2048), FixVec(-16384, 409), FixVec(-18841, -1228), FixVec(-18841, 1228), FixVec(-21708, -409), FixVec(-21299, 1638), FixVec(-24166, 409), FixVec(-23756, 2867), FixVec(-26624, 1638), FixVec(-25804, 3686), FixVec(-29900, 2457), FixVec(-29081, 4505), FixVec(-33177, 3686), FixVec(-31744, 6553), FixVec(-36044, 6144), FixVec(-34816, 7372), FixVec(-38502, 7782), FixVec(-36454, 9420), FixVec(-39321, 9011), FixVec(-42188, 9420), FixVec(-40140, 11059), FixVec(-43008, 11059), FixVec(-45875, 12288), FixVec(-42188, 13926), FixVec(-46284, 13926), FixVec(-48742, 15564), FixVec(-43827, 16793), FixVec(-47923, 17612), FixVec(-49971, 20070), FixVec(-3276, 6553), FixVec(-1638, 5734), FixVec(-819, 4915), FixVec(0, 2867), FixVec(819, 4915), FixVec(1638, 5734), FixVec(3276, 6553), FixVec(1638, 6553), FixVec(1228, 6963), FixVec(819, 7782), FixVec(0, 8192), FixVec(-819, 7782), FixVec(-1228, 6963), FixVec(-1638, 6553), FixVec(-1638, 7372), FixVec(-1228, 8192), FixVec(-2457, 9420), FixVec(-2457, 8192), FixVec(1228, 8192), FixVec(1638, 7372), FixVec(2457, 8192), FixVec(2457, 9420)]
            ,
            indices: [151, 0, 150, 150, 0, 149, 149, 0, 1, 149, 1, 146, 3, 4, 5, 3, 5, 2, 2, 5, 1, 6, 143, 146, 5, 6, 1, 140, 143, 6, 140, 141, 143, 148, 149, 147, 147, 149, 146, 145, 146, 144, 144, 146, 143, 6, 146, 1, 142, 143, 141, 8, 9, 10, 8, 10, 7, 7, 10, 6, 11, 140, 6, 11, 6, 10, 140, 136, 138, 11, 136, 140, 15, 136, 11, 139, 140, 138, 137, 138, 136, 135, 136, 134, 13, 14, 12, 12, 14, 11, 15, 132, 136, 11, 14, 15, 16, 132, 15, 133, 134, 132, 132, 134, 136, 131, 132, 130, 129, 130, 128, 16, 130, 132, 128, 130, 16, 128, 16, 126, 121, 124, 126, 124, 121, 122, 16, 121, 126, 127, 128, 126, 125, 126, 124, 110, 111, 112, 110, 112, 109, 109, 112, 106, 109, 106, 107, 106, 112, 113, 106, 113, 103, 123, 124, 122, 108, 109, 107, 105, 106, 104, 104, 106, 103, 121, 16, 17, 121, 119, 120, 118, 119, 121, 121, 17, 118, 118, 116, 117, 115, 116, 118, 152, 118, 17, 152, 17, 18, 168, 18, 19, 152, 115, 118, 153, 115, 152, 155, 153, 154, 155, 115, 153, 115, 155, 114, 168, 152, 18, 152, 168, 169, 19, 20, 168, 21, 168, 20, 162, 167, 168, 167, 162, 163, 168, 21, 173, 168, 173, 162, 162, 170, 161, 171, 161, 170, 173, 170, 162, 21, 22, 173, 102, 103, 101, 103, 113, 100, 99, 100, 98, 103, 100, 101, 155, 113, 114, 113, 97, 100, 100, 97, 98, 113, 155, 81, 155, 156, 157, 155, 157, 79, 81, 97, 113, 157, 158, 79, 97, 94, 96, 96, 94, 95, 152, 169, 166, 152, 166, 165, 165, 166, 164, 163, 166, 167, 163, 164, 166, 171, 160, 161, 171, 159, 160, 158, 171, 172, 173, 22, 23, 158, 159, 171, 173, 23, 24, 158, 173, 24, 158, 172, 173, 158, 24, 25, 81, 94, 97, 91, 94, 81, 155, 80, 81, 155, 79, 80, 158, 25, 76, 158, 76, 79, 78, 79, 76, 78, 76, 77, 73, 25, 26, 73, 76, 25, 73, 75, 76, 75, 73, 74, 68, 73, 26, 73, 70, 72, 68, 70, 73, 70, 68, 69, 68, 26, 66, 62, 26, 27, 26, 64, 66, 66, 64, 65, 91, 93, 94, 93, 91, 92, 91, 81, 88, 91, 88, 90, 81, 82, 88, 88, 82, 85, 88, 85, 87, 85, 82, 84, 82, 83, 84, 90, 88, 89, 87, 85, 86, 72, 70, 71, 68, 66, 67, 62, 64, 26, 58, 27, 31, 27, 28, 31, 31, 28, 30, 28, 29, 30, 64, 62, 63, 62, 27, 58, 62, 60, 61, 62, 58, 60, 58, 31, 54, 58, 54, 56, 54, 31, 36, 31, 32, 36, 36, 32, 35, 35, 32, 34, 32, 33, 34, 60, 58, 59, 58, 56, 57, 56, 54, 55, 54, 36, 51, 54, 51, 53, 36, 41, 48, 36, 37, 41, 41, 37, 40, 40, 37, 39, 37, 38, 39, 53, 51, 52, 36, 48, 51, 51, 48, 50, 48, 49, 50, 48, 41, 45, 41, 42, 45, 45, 42, 44, 42, 43, 44, 48, 45, 47, 45, 46, 47]
        )
    ]
    
}

private extension FixVec {
    static func float(_ x: Double, _ y: Double) -> FixVec {
        FixVec(x: x.fix, y: y.fix)
    }
}

