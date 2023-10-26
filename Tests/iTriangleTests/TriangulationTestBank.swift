import iShape
import iFixFloat
@testable import iTriangle

struct TriangulationTest {
    let shape: FixShape
    let points: FixPath
    let indices: [Int]
    let polygons: [ConvexPath]
}

struct TriangulationTestBank {

    static let data: [TriangulationTest] = [
        // 0
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-20, -20),
                    FixVec(-20, 20),
                    FixVec(20, 20),
                    FixVec(20, -20)]
                ),
                points: [
                    FixVec(-20, -20),
                    FixVec(-20, 20),
                    FixVec(20, 20),
                    FixVec(20, -20)],
                indices: [0, 1, 3, 1, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(20, 20),
                                FixVec(20, -20),
                                FixVec(-20, -20),
                                FixVec(-20, 20)],
                            side: [.outer, .outer, .outer, .outer])
                ]),
        // 1
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, 0),
                    FixVec(0, 15),
                    FixVec(15, 0),
                    FixVec(0, -15)]
                ),
                points: [
                    FixVec(0, 15),
                    FixVec(15, 0),
                    FixVec(0, -15),
                    FixVec(-15, 0)],
                indices: [3, 0, 2, 2, 0, 1],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(15, 0),
                                FixVec(0, -15),
                                FixVec(-15, 0),
                                FixVec(0, 15)]
                            , side: [.outer, .outer, .outer, .outer])]
        ),
        // 2
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, -15),
                    FixVec(-25, 0),
                    FixVec(-15, 15),
                    FixVec(15, 15),
                    FixVec(25, 0),
                    FixVec(15, -15)]
                ),
                points: [
                    FixVec(-15, 15),
                    FixVec(15, 15),
                    FixVec(25, 0),
                    FixVec(15, -15),
                    FixVec(-15, -15),
                    FixVec(-25, 0)],
                indices: [5, 0, 4, 4, 0, 3, 0, 1, 3, 3, 1, 2],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(25, 0),
                                FixVec(15, -15),
                                FixVec(-15, -15),
                                FixVec(-25, 0),
                                FixVec(-15, 15),
                                FixVec(15, 15)]
                            , side: [.outer, .outer, .outer, .outer, .outer, .outer])]),

        // 3
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-5, -15),
                    FixVec(-10, 0),
                    FixVec(0, 15),
                    FixVec(10, 5),
                    FixVec(5, -10)]
                ),
                points: [
                    FixVec(0, 15),
                    FixVec(10, 5),
                    FixVec(5, -10),
                    FixVec(-5, -15),
                    FixVec(-10, 0)],
                indices: [1, 4, 0, 4, 2, 3, 1, 2, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5, -15),
                                FixVec(-10, 0),
                                FixVec(0, 15),
                                FixVec(10, 5),
                                FixVec(5, -10)]
                            , side: [.outer, .outer, .outer, .outer, .outer])]),

        // 4
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-20, -20),
                        FixVec(-20, 20),
                        FixVec(20, 20),
                        FixVec(20, -20)],
                    [
                        FixVec(-10, -10),
                        FixVec(10, -10),
                        FixVec(10, 10),
                        FixVec(-10, 10)]]
                ),
                points: [
                    FixVec(-20, -20),
                    FixVec(-20, 20),
                    FixVec(20, 20),
                    FixVec(20, -20),
                    FixVec(10, -10),
                    FixVec(10, 10),
                    FixVec(-10, 10),
                    FixVec(-10, -10)],
                indices: [0, 1, 7, 7, 1, 6, 6, 1, 5, 1, 2, 5, 7, 4, 0, 0, 4, 3, 4, 5, 3, 5, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-10, 10),
                                FixVec(-10, -10),
                                FixVec(-20, -20),
                                FixVec(-20, 20)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(20, 20),
                                FixVec(10, 10),
                                FixVec(-10, 10),
                                FixVec(-20, 20)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(20, -20),
                                FixVec(-20, -20),
                                FixVec(-10, -10),
                                FixVec(10, -10)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(20, 20),
                                FixVec(20, -20),
                                FixVec(10, -10),
                                FixVec(10, 10)]
                            , side: [.outer, .inner, .outer, .inner]
                    )]),

        // 5
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-15, 0),
                        FixVec(0, 15),
                        FixVec(15, 0),
                        FixVec(0, -15)],
                    [
                        FixVec(-5, 0),
                        FixVec(0, -5),
                        FixVec(5, 0),
                        FixVec(0, 5)
                    ]]),
                points: [
                    FixVec(0, 15),
                    FixVec(15, 0),
                    FixVec(0, -15),
                    FixVec(-15, 0),
                    FixVec(-5, 0),
                    FixVec(0, -5),
                    FixVec(5, 0),
                    FixVec(0, 5)],
                indices: [4, 3, 7, 3, 0, 7, 7, 0, 6, 0, 1, 6, 3, 4, 2, 4, 5, 2, 5, 6, 2, 2, 6, 1],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(0, 15),
                                FixVec(0, 5),
                                FixVec(-5, 0),
                                FixVec(-15, 0)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15, 0),
                                FixVec(5, 0),
                                FixVec(0, 5),
                                FixVec(0, 15)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -5),
                                FixVec(0, -15),
                                FixVec(-15, 0),
                                FixVec(-5, 0)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15, 0),
                                FixVec(0, -15),
                                FixVec(0, -5),
                                FixVec(5, 0)]
                            , side: [.outer, .inner, .outer, .inner])]),

        // 6
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, -10),
                    FixVec(0, 0),
                    FixVec(-10, 10),
                    FixVec(10, 0)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(0, 0),
                    FixVec(-10, 10),
                    FixVec(10, 0)],
                indices: [0, 1, 3, 2, 3, 1],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10, 0),
                                FixVec(-10, -10),
                                FixVec(0, 0)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-10, 10),
                                FixVec(10, 0)]
                            , side: [.outer, .outer, .inner])]),

        // 7
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 0),
                    FixVec(10, 10),
                    FixVec(0, 0),
                    FixVec(10, -10)]
                ),
                points: [
                    FixVec(10, 10),
                    FixVec(0, 0),
                    FixVec(10, -10),
                    FixVec(-10, 0)],
                indices: [3, 0, 1, 3, 1, 2],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-10, 0),
                                FixVec(10, 10)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, 0),
                                FixVec(0, 0)]
                            , side: [.outer, .inner, .outer])]),

        // 8
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 0),
                    FixVec(-20, 20),
                    FixVec(-5, 20),
                    FixVec(0, 10),
                    FixVec(5, 20),
                    FixVec(20, 20),
                    FixVec(10, 0),
                    FixVec(20, -20),
                    FixVec(5, -20),
                    FixVec(0, -10),
                    FixVec(-5, -20),
                    FixVec(-20, -20)]
                ),
                points: [
                    FixVec(-20, -20),
                    FixVec(-10, 0),
                    FixVec(-20, 20),
                    FixVec(-5, 20),
                    FixVec(0, 10),
                    FixVec(5, 20),
                    FixVec(20, 20),
                    FixVec(10, 0),
                    FixVec(20, -20),
                    FixVec(5, -20),
                    FixVec(0, -10),
                    FixVec(-5, -20)],
                indices: [0, 1, 11, 2, 3, 1, 4, 1, 3, 1, 10, 11, 4, 10, 1, 10, 4, 7, 4, 5, 7, 10, 7, 9, 5, 6, 7, 9, 7, 8],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(0, 10),
                                FixVec(0, -10),
                                FixVec(-5, -20),
                                FixVec(-20, -20),
                                FixVec(-10, 0)]
                            , side: [.inner, .outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 10),
                                FixVec(-10, 0),
                                FixVec(-20, 20),
                                FixVec(-5, 20)]
                            , side: [.inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(20, -20),
                                FixVec(5, -20),
                                FixVec(0, -10),
                                FixVec(0, 10),
                                FixVec(10, 0)]
                            , side: [.outer, .outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(20, 20),
                                FixVec(10, 0),
                                FixVec(0, 10),
                                FixVec(5, 20)]
                            , side: [.outer, .inner, .outer, .outer])]),

        // 9
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(0, -5),
                    FixVec(0, 0),
                    FixVec(10, -10),
                    FixVec(-10, -10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(0, -5),
                    FixVec(0, 0),
                    FixVec(10, -10)],
                indices: [0, 1, 3, 1, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(0, -5)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(0, -5),
                                FixVec(0, 0)]
                            , side: [.inner, .outer, .outer])]),

        // 10
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, -15),
                    FixVec(-15, 0),
                    FixVec(0, 0),
                    FixVec(0, 15),
                    FixVec(15, -15)]
                ),
                points: [
                    FixVec(-15, -15),
                    FixVec(-15, 0),
                    FixVec(0, 0),
                    FixVec(0, 15),
                    FixVec(15, -15)],
                indices: [1, 2, 0, 0, 2, 4, 2, 3, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(15, -15),
                                FixVec(-15, -15),
                                FixVec(-15, 0),
                                FixVec(0, 0)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, -15),
                                FixVec(0, 0),
                                FixVec(0, 15)]
                            , side: [.inner, .outer, .outer])]),

        // 11
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, -15),
                    FixVec(-15, 0),
                    FixVec(-1, 20),
                    FixVec(0, 5),
                    FixVec(15, -15)]
                ),
                points: [
                    FixVec(-15, -15),
                    FixVec(-15, 0),
                    FixVec(-1, 20),
                    FixVec(0, 5),
                    FixVec(15, -15)],
                indices: [1, 2, 3, 1, 3, 0, 0, 3, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-15, -15),
                                FixVec(-15, 0),
                                FixVec(-1, 20),
                                FixVec(0, 5)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, -15),
                                FixVec(-15, -15),
                                FixVec(0, 5)]
                            , side: [.outer, .inner, .outer])]),

        // 12
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 0),
                    FixVec(10, 10),
                    FixVec(0, 0),
                    FixVec(10, -20),
                    FixVec(-10, -20)]
                ),
                points: [
                    FixVec(-10, -20),
                    FixVec(-10, 0),
                    FixVec(10, 10),
                    FixVec(0, 0),
                    FixVec(10, -20)],
                indices: [0, 1, 3, 1, 2, 3, 0, 3, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10, -20),
                                FixVec(-10, -20),
                                FixVec(-10, 0),
                                FixVec(0, 0)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-10, 0),
                                FixVec(10, 10)]
                            , side: [.inner, .outer, .outer])]),

        // 13
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, -15),
                    FixVec(-10, 0),
                    FixVec(-15, 15),
                    FixVec(15, 15),
                    FixVec(15, -15)]
                ),
                points: [
                    FixVec(-15, -15),
                    FixVec(-10, 0),
                    FixVec(-15, 15),
                    FixVec(15, 15),
                    FixVec(15, -15)],
                indices: [0, 1, 4, 1, 3, 4, 2, 3, 1],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(15, 15),
                                FixVec(15, -15),
                                FixVec(-15, -15),
                                FixVec(-10, 0)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10, 0),
                                FixVec(-15, 15),
                                FixVec(15, 15)]
                            , side: [.outer, .outer, .inner])]),

        // 14
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, -15),
                    FixVec(-15, -5),
                    FixVec(-20, 15),
                    FixVec(15, 15),
                    FixVec(15, -15)]
                ),
                points: [
                    FixVec(15, 15),
                    FixVec(15, -15),
                    FixVec(-15, -15),
                    FixVec(-15, -5),
                    FixVec(-20, 15)],
                indices: [4, 0, 3, 2, 3, 1, 3, 0, 1],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(15, -15),
                                FixVec(-15, -5),
                                FixVec(-20, 15),
                                FixVec(15, 15)]
                            , side: [.inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15, -15),
                                FixVec(-15, -15),
                                FixVec(-15, -5)]
                            , side: [.outer, .outer, .inner])]),

        // 15
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, 0),
                    FixVec(-5, 10),
                    FixVec(-10, 15),
                    FixVec(5, 20),
                    FixVec(15, 0),
                    FixVec(5, -20),
                    FixVec(-10, -15),
                    FixVec(-5, -10)]
                ),
                points: [
                    FixVec(-5, 10),
                    FixVec(-10, 15),
                    FixVec(5, 20),
                    FixVec(15, 0),
                    FixVec(5, -20),
                    FixVec(-10, -15),
                    FixVec(-5, -10),
                    FixVec(-15, 0)],
                indices: [7, 0, 6, 5, 6, 4, 6, 0, 3, 1, 2, 0, 0, 2, 3, 6, 3, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(5, 20),
                                FixVec(15, 0),
                                FixVec(5, -20),
                                FixVec(-5, -10),
                                FixVec(-15, 0),
                                FixVec(-5, 10)]
                            , side: [.outer, .outer, .inner, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5, -20),
                                FixVec(-10, -15),
                                FixVec(-5, -10)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-5, 10),
                                FixVec(-10, 15),
                                FixVec(5, 20)]
                            , side: [.outer, .outer, .inner])]),

        // 16
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, 0),
                    FixVec(-15, 10),
                    FixVec(-10, 15),
                    FixVec(5, 20),
                    FixVec(15, 0),
                    FixVec(5, -20),
                    FixVec(-10, -15),
                    FixVec(-5, -10)]
                ),
                points: [
                    FixVec(-15, 0),
                    FixVec(-15, 10),
                    FixVec(-10, 15),
                    FixVec(5, 20),
                    FixVec(15, 0),
                    FixVec(5, -20),
                    FixVec(-10, -15),
                    FixVec(-5, -10)],
                indices: [1, 2, 0, 0, 2, 7, 2, 3, 4, 2, 4, 7, 4, 5, 7, 6, 7, 5],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(5, 20),
                                FixVec(15, 0),
                                FixVec(5, -20),
                                FixVec(-5, -10),
                                FixVec(-15, 0),
                                FixVec(-15, 10),
                                FixVec(-10, 15)]
                            , side: [.outer, .outer, .inner, .outer, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, -20),
                                FixVec(-10, -15),
                                FixVec(-5, -10)]
                            , side: [.outer, .outer, .inner])]),

        // 17
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(5, 0),
                    FixVec(-10, 5),
                    FixVec(-10, 15),
                    FixVec(5, 20),
                    FixVec(15, 0),
                    FixVec(5, -20),
                    FixVec(-10, -15),
                    FixVec(-10, -5)]
                ),
                points: [
                    FixVec(-10, -15),
                    FixVec(-10, -5),
                    FixVec(5, 0),
                    FixVec(-10, 5),
                    FixVec(-10, 15),
                    FixVec(5, 20),
                    FixVec(15, 0),
                    FixVec(5, -20)],
                indices: [0, 1, 7, 1, 2, 7, 2, 5, 6, 2, 6, 7, 3, 4, 2, 4, 5, 2],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(15, 0),
                                FixVec(5, -20),
                                FixVec(-10, -15),
                                FixVec(-10, -5),
                                FixVec(5, 0)]
                            , side: [.outer, .outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10, 5),
                                FixVec(-10, 15),
                                FixVec(5, 20),
                                FixVec(15, 0),
                                FixVec(5, 0)]
                            , side: [.outer, .outer, .outer, .inner, .outer])]),

        // 18
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(0, 0),
                    FixVec(-10, 5),
                    FixVec(-10, 15),
                    FixVec(10, 15),
                    FixVec(5, 10),
                    FixVec(10, -15),
                    FixVec(-10, -15),
                    FixVec(-10, -5)]
                ),
                points: [
                    FixVec(-10, -15),
                    FixVec(-10, -5),
                    FixVec(0, 0),
                    FixVec(-10, 5),
                    FixVec(-10, 15),
                    FixVec(10, 15),
                    FixVec(5, 10),
                    FixVec(10, -15)],
                indices: [1, 2, 0, 0, 2, 7, 2, 6, 7, 3, 4, 6, 3, 6, 2, 4, 5, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10, -15),
                                FixVec(-10, -15),
                                FixVec(-10, -5),
                                FixVec(0, 0)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -15),
                                FixVec(0, 0),
                                FixVec(5, 10)]
                            , side: [.inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-10, 5),
                                FixVec(-10, 15),
                                FixVec(5, 10)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5, 10),
                                FixVec(-10, 15),
                                FixVec(10, 15)]
                            , side: [.inner, .outer, .outer])]),

        // 19
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15, 0),
                    FixVec(-5, 10),
                    FixVec(-10, 15),
                    FixVec(5, 20),
                    FixVec(0, 0),
                    FixVec(5, -20),
                    FixVec(-10, -15),
                    FixVec(-5, -10)]
                ),
                points: [
                    FixVec(-5, 10),
                    FixVec(-10, 15),
                    FixVec(5, 20),
                    FixVec(0, 0),
                    FixVec(5, -20),
                    FixVec(-10, -15),
                    FixVec(-5, -10),
                    FixVec(-15, 0)],
                indices: [7, 0, 3, 7, 3, 6, 5, 6, 4, 6, 3, 4, 1, 2, 0, 0, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(5, -20),
                                FixVec(-5, -10),
                                FixVec(-15, 0),
                                FixVec(-5, 10),
                                FixVec(0, 0)]
                            , side: [.inner, .outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, -20),
                                FixVec(-10, -15),
                                FixVec(-5, -10)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-5, 10),
                                FixVec(-10, 15),
                                FixVec(5, 20)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-5, 10),
                                FixVec(5, 20)]
                            , side: [.inner, .inner, .outer])]),

        // 20
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15360, 0),
                    FixVec(-5120, 10240),
                    FixVec(-10240, 15360),
                    FixVec(-2560, 20480),
                    FixVec(5120, 20480),
                    FixVec(2560, 10240),
                    FixVec(0, 0),
                    FixVec(2560, -10240),
                    FixVec(5120, -20480),
                    FixVec(-2560, -20480),
                    FixVec(-10240, -15360),
                    FixVec(-5120, -10240)]
                ),
                points: [
                    FixVec(-5120, 10240),
                    FixVec(-10240, 15360),
                    FixVec(-2560, 20480),
                    FixVec(5120, 20480),
                    FixVec(0, 0),
                    FixVec(5120, -20480),
                    FixVec(-2560, -20480),
                    FixVec(-10240, -15360),
                    FixVec(-5120, -10240),
                    FixVec(-15360, 0)],
                indices: [4, 9, 0, 7, 8, 6, 4, 8, 9, 3, 0, 2, 8, 4, 5, 3, 4, 0, 1, 2, 0, 8, 5, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5120, -10240),
                                FixVec(-15360, 0),
                                FixVec(-5120, 10240),
                                FixVec(5120, 20480),
                                FixVec(0, 0)]
                            , side: [.outer, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5120, -20480),
                                FixVec(-2560, -20480),
                                FixVec(-10240, -15360),
                                FixVec(-5120, -10240)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10240, 15360),
                                FixVec(-2560, 20480),
                                FixVec(5120, 20480),
                                FixVec(-5120, 10240)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5120, -20480),
                                FixVec(-5120, -10240),
                                FixVec(0, 0)]
                            , side: [.inner, .inner, .outer])]),

        // 21
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-15360, 0),
                    FixVec(-5120, 10240),
                    FixVec(-10240, 15360),
                    FixVec(-2560, 20480),
                    FixVec(5120, 20480),
                    FixVec(-2560, -15360),
                    FixVec(5120, -20480),
                    FixVec(-2560, -20480),
                    FixVec(-10240, -15360),
                    FixVec(-5120, -10240)]
                ),
                points: [
                    FixVec(-5120, 10240),
                    FixVec(-10240, 15360),
                    FixVec(-2560, 20480),
                    FixVec(5120, 20480),
                    FixVec(-2560, -15360),
                    FixVec(5120, -20480),
                    FixVec(-2560, -20480),
                    FixVec(-10240, -15360),
                    FixVec(-5120, -10240),
                    FixVec(-15360, 0)],
                indices: [9, 0, 8, 7, 8, 4, 8, 0, 3, 7, 4, 6, 6, 4, 5, 1, 2, 0, 0, 2, 3, 8, 3, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(5120, 20480),
                                FixVec(-5120, -10240),
                                FixVec(-15360, 0),
                                FixVec(-5120, 10240)]
                            , side: [.inner, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-2560, -20480),
                                FixVec(-10240, -15360),
                                FixVec(-5120, -10240),
                                FixVec(-2560, -15360)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5120, -20480),
                                FixVec(-2560, -20480),
                                FixVec(-2560, -15360)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5120, 20480),
                                FixVec(-5120, 10240),
                                FixVec(-10240, 15360),
                                FixVec(-2560, 20480)]
                            , side: [.inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-2560, -15360),
                                FixVec(-5120, -10240),
                                FixVec(5120, 20480)]
                            , side: [.inner, .inner, .outer])]
        ),

        // 22
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 10),
                    FixVec(-5, 5),
                    FixVec(10, 20),
                    FixVec(20, 20),
                    FixVec(25, 20),
                    FixVec(25, -5),
                    FixVec(10, -5),
                    FixVec(10, -10),
                    FixVec(-10, -10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(-5, 5),
                    FixVec(10, 20),
                    FixVec(25, 20),
                    FixVec(25, -5),
                    FixVec(10, -5),
                    FixVec(10, -10)],
                indices: [1, 2, 0, 0, 2, 6, 0, 6, 7, 2, 3, 6, 6, 3, 5, 3, 4, 5],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-10, -10),
                                FixVec(-10, 10),
                                FixVec(-5, 5)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 20),
                                FixVec(10, -5),
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(-5, 5)]
                            , side: [.inner, .outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(25, 20),
                                FixVec(25, -5),
                                FixVec(10, -5),
                                FixVec(10, 20)]
                            , side: [.outer, .outer, .inner, .outer])]),

        // 23
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 10),
                    FixVec(-5, 15),
                    FixVec(10, 20),
                    FixVec(20, 20),
                    FixVec(25, 20),
                    FixVec(25, -5),
                    FixVec(10, -5),
                    FixVec(10, -10),
                    FixVec(-10, -10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(-5, 15),
                    FixVec(10, 20),
                    FixVec(25, 20),
                    FixVec(25, -5),
                    FixVec(10, -5),
                    FixVec(10, -10)],
                indices: [6, 1, 2, 0, 1, 6, 0, 6, 7, 2, 3, 6, 6, 3, 5, 3, 4, 5],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(25, 20),
                                FixVec(25, -5),
                                FixVec(10, -5),
                                FixVec(-10, 10),
                                FixVec(-5, 15),
                                FixVec(10, 20)]
                            , side: [.outer, .outer, .inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(-10, 10),
                                FixVec(10, -5)]
                            , side: [.outer, .outer, .inner, .outer])]),

        // 24
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 10),
                    FixVec(-5, 5),
                    FixVec(10, 20),
                    FixVec(15, 10),
                    FixVec(25, 20),
                    FixVec(25, 0),
                    FixVec(10, 0),
                    FixVec(10, -10),
                    FixVec(-10, -10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(-5, 5),
                    FixVec(10, 20),
                    FixVec(15, 10),
                    FixVec(25, 20),
                    FixVec(25, 0),
                    FixVec(10, 0),
                    FixVec(10, -10)],
                indices: [1, 2, 0, 0, 2, 8, 8, 2, 7, 2, 3, 4, 2, 4, 7, 7, 4, 6, 4, 5, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(-10, 10),
                                FixVec(-5, 5)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 0),
                                FixVec(10, -10),
                                FixVec(-5, 5)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 0),
                                FixVec(-5, 5),
                                FixVec(10, 20),
                                FixVec(15, 10)]
                            , side: [.inner, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(25, 20),
                                FixVec(25, 0),
                                FixVec(10, 0),
                                FixVec(15, 10)]
                            , side: [.outer, .outer, .inner, .outer])]),

        // 25
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 10),
                    FixVec(-5, -5),
                    FixVec(10, 20),
                    FixVec(15, 10),
                    FixVec(25, 20),
                    FixVec(25, 0),
                    FixVec(10, 0),
                    FixVec(10, -10),
                    FixVec(-10, -10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(-5, -5),
                    FixVec(10, 20),
                    FixVec(15, 10),
                    FixVec(25, 20),
                    FixVec(25, 0),
                    FixVec(10, 0),
                    FixVec(10, -10)],
                indices: [1, 2, 0, 0, 2, 8, 8, 2, 7, 2, 3, 7, 3, 4, 7, 7, 4, 6, 4, 5, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-10, -10),
                                FixVec(-10, 10),
                                FixVec(-5, -5)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 0),
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(-5, -5)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, 10),
                                FixVec(10, 0),
                                FixVec(-5, -5),
                                FixVec(10, 20)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(25, 20),
                                FixVec(25, 0),
                                FixVec(10, 0),
                                FixVec(15, 10)]
                            , side: [.outer, .outer, .inner, .outer])]),

        // 26
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(10, 20),
                    FixVec(15, 10),
                    FixVec(25, 20),
                    FixVec(25, 0),
                    FixVec(10, 0),
                    FixVec(10, -10),
                    FixVec(-10, -10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(10, 20),
                    FixVec(15, 10),
                    FixVec(25, 20),
                    FixVec(25, 0),
                    FixVec(10, 0),
                    FixVec(10, -10)],
                indices: [0, 1, 7, 0, 7, 8, 1, 2, 7, 2, 3, 4, 2, 4, 7, 7, 4, 6, 4, 5, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10, 10),
                                FixVec(10, 0),
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(-10, 10)]
                            , side: [.inner, .outer, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, 0),
                                FixVec(10, 10),
                                FixVec(10, 20),
                                FixVec(15, 10)]
                            , side: [.inner, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(25, 20),
                                FixVec(25, 0),
                                FixVec(10, 0),
                                FixVec(15, 10)]
                            , side: [.outer, .outer, .inner, .outer])]),

        // 27
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-35, 5),
                    FixVec(-20, 10),
                    FixVec(-18, 20),
                    FixVec(0, 20),
                    FixVec(5, 10),
                    FixVec(15, 5),
                    FixVec(20, 10),
                    FixVec(35, 0),
                    FixVec(25, -10),
                    FixVec(10, -4),
                    FixVec(-5, -15),
                    FixVec(-5, -20),
                    FixVec(-15, -25),
                    FixVec(-20, -10),
                    FixVec(-30, -5)]
                ),
                points: [
                    FixVec(-20, 10),
                    FixVec(-18, 20),
                    FixVec(0, 20),
                    FixVec(5, 10),
                    FixVec(15, 5),
                    FixVec(20, 10),
                    FixVec(35, 0),
                    FixVec(25, -10),
                    FixVec(10, -4),
                    FixVec(-5, -15),
                    FixVec(-5, -20),
                    FixVec(-15, -25),
                    FixVec(-20, -10),
                    FixVec(-30, -5),
                    FixVec(-35, 5)],
                indices: [13, 14, 0, 13, 0, 12, 2, 0, 1, 12, 0, 9, 12, 9, 11, 11, 9, 10, 2, 3, 0, 0, 3, 9, 9, 3, 8, 3, 4, 8, 4, 5, 7, 4, 7, 8, 5, 6, 7],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(15, 5),
                                FixVec(10, -4),
                                FixVec(-5, -15),
                                FixVec(-20, -10),
                                FixVec(-30, -5),
                                FixVec(-35, 5),
                                FixVec(-20, 10),
                                FixVec(5, 10)]
                            , side: [.inner, .outer, .inner, .outer, .outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, 10),
                                FixVec(-20, 10),
                                FixVec(-18, 20),
                                FixVec(0, 20)]
                            , side: [.inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-5, -20),
                                FixVec(-15, -25),
                                FixVec(-20, -10),
                                FixVec(-5, -15)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(35, 0),
                                FixVec(25, -10),
                                FixVec(10, -4),
                                FixVec(15, 5),
                                FixVec(20, 10)]
                            , side: [.outer, .outer, .inner, .outer, .outer])]),

        // 28
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-35, 5),
                    FixVec(-20, 10),
                    FixVec(-10, 20),
                    FixVec(0, 20),
                    FixVec(5, 10),
                    FixVec(15, 5),
                    FixVec(20, 10),
                    FixVec(35, 0),
                    FixVec(25, -10),
                    FixVec(10, -4),
                    FixVec(-5, -15),
                    FixVec(-5, -20),
                    FixVec(-15, -25),
                    FixVec(-20, -10),
                    FixVec(-30, -5)]
                ),
                points: [
                    FixVec(-20, 10),
                    FixVec(-10, 20),
                    FixVec(0, 20),
                    FixVec(5, 10),
                    FixVec(15, 5),
                    FixVec(20, 10),
                    FixVec(35, 0),
                    FixVec(25, -10),
                    FixVec(10, -4),
                    FixVec(-5, -15),
                    FixVec(-5, -20),
                    FixVec(-15, -25),
                    FixVec(-20, -10),
                    FixVec(-30, -5),
                    FixVec(-35, 5)],
                indices: [13, 14, 0, 13, 0, 12, 0, 1, 3, 9, 12, 0, 9, 11, 12, 11, 9, 10, 1, 2, 3, 0, 3, 9, 9, 3, 8, 3, 4, 8, 4, 5, 7, 4, 7, 8, 5, 6, 7],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(15, 5),
                                FixVec(10, -4),
                                FixVec(-5, -15),
                                FixVec(-20, -10),
                                FixVec(-30, -5),
                                FixVec(-35, 5),
                                FixVec(-20, 10),
                                FixVec(5, 10)]
                            , side: [.inner, .outer, .inner, .outer, .outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 20),
                                FixVec(5, 10),
                                FixVec(-20, 10),
                                FixVec(-10, 20)]
                            , side: [.outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-5, -20),
                                FixVec(-15, -25),
                                FixVec(-20, -10),
                                FixVec(-5, -15)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(35, 0),
                                FixVec(25, -10),
                                FixVec(10, -4),
                                FixVec(15, 5),
                                FixVec(20, 10)]
                            , side: [.outer, .outer, .inner, .outer, .outer])]),

        // 29
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10240, -10240),
                    FixVec(-10240, -5120),
                    FixVec(-10240, 0),
                    FixVec(-10240, 5120),
                    FixVec(-10240, 10240),
                    FixVec(10240, 10240),
                    FixVec(10240, 5120),
                    FixVec(10240, 0),
                    FixVec(10240, -5120),
                    FixVec(10240, -10240)]
                ),
                points: [
                    FixVec(-10240, -10240),
                    FixVec(-10240, 10240),
                    FixVec(10240, 10240),
                    FixVec(10240, -10240)],
                indices: [0, 1, 3, 1, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10240, 10240),
                                FixVec(10240, -10240),
                                FixVec(-10240, -10240),
                                FixVec(-10240, 10240)]
                            , side: [.outer, .outer, .outer, .outer])]
        ),

        // 30
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-20, 0),
                    FixVec(-15, 15),
                    FixVec(-10, 20),
                    FixVec(-5, 15),
                    FixVec(0, 20),
                    FixVec(5, 15),
                    FixVec(10, 20),
                    FixVec(15, 15),
                    FixVec(25, 0),
                    FixVec(20, -15),
                    FixVec(15, -20),
                    FixVec(10, -15),
                    FixVec(5, -20),
                    FixVec(0, -15),
                    FixVec(-5, -20),
                    FixVec(-10, -15)]
                ),
                points: [
                    FixVec(-20, 0),
                    FixVec(-15, 15),
                    FixVec(-10, 20),
                    FixVec(-5, 15),
                    FixVec(0, 20),
                    FixVec(5, 15),
                    FixVec(10, 20),
                    FixVec(15, 15),
                    FixVec(25, 0),
                    FixVec(20, -15),
                    FixVec(15, -20),
                    FixVec(10, -15),
                    FixVec(5, -20),
                    FixVec(0, -15),
                    FixVec(-5, -20),
                    FixVec(-10, -15)],
                indices: [0, 1, 3, 3, 1, 2, 13, 0, 3, 13, 15, 0, 13, 14, 15, 5, 3, 4, 5, 13, 3, 11, 13, 5, 11, 12, 13, 7, 5, 6, 8, 5, 7, 8, 11, 5, 9, 10, 11, 11, 8, 9],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(5, 15),
                                FixVec(0, -15),
                                FixVec(-5, -20),
                                FixVec(-10, -15),
                                FixVec(-20, 0),
                                FixVec(-15, 15),
                                FixVec(-5, 15)]
                            , side: [.inner, .outer, .outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10, 20),
                                FixVec(-5, 15),
                                FixVec(-15, 15)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 20),
                                FixVec(5, 15),
                                FixVec(-5, 15)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, 20),
                                FixVec(15, 15),
                                FixVec(25, 0),
                                FixVec(20, -15),
                                FixVec(10, -15),
                                FixVec(0, -15),
                                FixVec(5, 15)]
                            , side: [.outer, .outer, .outer, .inner, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -15),
                                FixVec(10, -15),
                                FixVec(5, -20)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -15),
                                FixVec(20, -15),
                                FixVec(15, -20)]
                            , side: [.inner, .outer, .outer])]),

        // 31
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-20, 5),
                    FixVec(-10, 10),
                    FixVec(-5, 20),
                    FixVec(0, 25),
                    FixVec(5, 15),
                    FixVec(10, 0),
                    FixVec(15, 5),
                    FixVec(20, -5),
                    FixVec(15, -15),
                    FixVec(5, -25),
                    FixVec(0, -15),
                    FixVec(-10, -10),
                    FixVec(-15, -5)]
                ),
                points: [
                    FixVec(-10, 10),
                    FixVec(-5, 20),
                    FixVec(0, 25),
                    FixVec(5, 15),
                    FixVec(10, 0),
                    FixVec(15, 5),
                    FixVec(20, -5),
                    FixVec(15, -15),
                    FixVec(5, -25),
                    FixVec(0, -15),
                    FixVec(-10, -10),
                    FixVec(-15, -5),
                    FixVec(-20, 5)],
                indices: [11, 12, 0, 11, 0, 10, 0, 1, 3, 4, 10, 0, 3, 1, 2, 4, 0, 3, 4, 9, 10, 9, 4, 7, 9, 7, 8, 4, 5, 6, 4, 6, 7],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(20, -5),
                                FixVec(15, -15),
                                FixVec(0, -15),
                                FixVec(-10, -10),
                                FixVec(-15, -5),
                                FixVec(-20, 5),
                                FixVec(-10, 10),
                                FixVec(10, 0)]
                            , side: [.outer, .inner, .outer, .outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 25),
                                FixVec(5, 15),
                                FixVec(10, 0),
                                FixVec(-10, 10),
                                FixVec(-5, 20)]
                            , side: [.outer, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, -25),
                                FixVec(0, -15),
                                FixVec(15, -15)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(20, -5),
                                FixVec(10, 0),
                                FixVec(15, 5)]
                            , side: [.inner, .outer, .outer])]),

        // 32
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-350, 50),
                    FixVec(-135, 80),
                    FixVec(-95, 200),
                    FixVec(30, 200),
                    FixVec(85, 110),
                    FixVec(150, 50),
                    FixVec(32, 145),
                    FixVec(350, 0),
                    FixVec(250, -100),
                    FixVec(0, 15),
                    FixVec(-5, -125),
                    FixVec(-50, -200),
                    FixVec(-75, 25),
                    FixVec(-310, -40)]
                ),
                points: [
                    FixVec(-135, 80),
                    FixVec(-95, 200),
                    FixVec(30, 200),
                    FixVec(75, 126),
                    FixVec(32, 145),
                    FixVec(150, 50),
                    FixVec(85, 110),
                    FixVec(75, 126),
                    FixVec(350, 0),
                    FixVec(250, -100),
                    FixVec(0, 15),
                    FixVec(-5, -125),
                    FixVec(-50, -200),
                    FixVec(-75, 25),
                    FixVec(-310, -40),
                    FixVec(-350, 50)],
                indices: [15, 0, 14, 14, 0, 13, 4, 0, 1, 12, 13, 11, 4, 13, 0, 13, 10, 11, 1, 2, 4, 13, 4, 10, 4, 5, 10, 10, 5, 9, 2, 3, 4, 6, 7, 5, 7, 8, 5, 5, 8, 9],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-75, 25),
                                FixVec(-310, -40),
                                FixVec(-350, 50),
                                FixVec(-135, 80)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 15),
                                FixVec(-75, 25),
                                FixVec(-135, 80),
                                FixVec(-95, 200),
                                FixVec(30, 200),
                                FixVec(32, 145)]
                            , side: [.inner, .inner, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 15),
                                FixVec(-5, -125),
                                FixVec(-50, -200),
                                FixVec(-75, 25)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(250, -100),
                                FixVec(0, 15),
                                FixVec(32, 145),
                                FixVec(150, 50)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(32, 145),
                                FixVec(30, 200),
                                FixVec(75, 126)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(350, 0),
                                FixVec(150, 50),
                                FixVec(85, 110),
                                FixVec(75, 126)]
                            , side: [.inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(250, -100),
                                FixVec(150, 50),
                                FixVec(350, 0)]
                            , side: [.inner, .inner, .outer])]),

        // 33
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 5),
                    FixVec(-5, 5),
                    FixVec(0, 0),
                    FixVec(5, 5),
                    FixVec(10, 5),
                    FixVec(10, -5),
                    FixVec(5, -5),
                    FixVec(0, 0),
                    FixVec(-5, -5),
                    FixVec(-10, -5)]
                ),
                points: [
                    FixVec(-10, -5),
                    FixVec(-10, 5),
                    FixVec(-5, 5),
                    FixVec(0, 0),
                    FixVec(-5, -5),
                    FixVec(5, 5),
                    FixVec(10, 5),
                    FixVec(10, -5),
                    FixVec(5, -5),
                    FixVec(0, 0)],
                indices: [0, 1, 4, 1, 2, 4, 4, 2, 3, 9, 5, 8, 8, 5, 7, 5, 6, 7],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-5, -5),
                                FixVec(-10, -5),
                                FixVec(-10, 5),
                                FixVec(-5, 5)]
                            , side: [.outer, .outer, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, 5),
                                FixVec(10, -5),
                                FixVec(5, -5),
                                FixVec(0, 0),
                                FixVec(5, 5)]
                            , side: [.outer, .outer, .outer, .outer, .outer])]),

        // 34
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-512, -5120),
                    FixVec(-10240, 0),
                    FixVec(-10240, 10240),
                    FixVec(20480, 10240),
                    FixVec(10240, 5120),
                    FixVec(10240, 0),
                    FixVec(5120, 5120),
                    FixVec(0, -15360)]
                ),
                points: [
                    FixVec(-10240, 0),
                    FixVec(-10240, 10240),
                    FixVec(20480, 10240),
                    FixVec(10240, 5120),
                    FixVec(10240, 0),
                    FixVec(5120, 5120),
                    FixVec(0, -15360),
                    FixVec(-512, -5120)],
                indices: [0, 1, 5, 6, 7, 5, 0, 5, 7, 4, 5, 3, 5, 1, 2, 5, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-512, -5120),
                                FixVec(-10240, 0),
                                FixVec(-10240, 10240),
                                FixVec(5120, 5120)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5120, 5120),
                                FixVec(0, -15360),
                                FixVec(-512, -5120)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10240, 5120),
                                FixVec(10240, 0),
                                FixVec(5120, 5120)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10240, 5120),
                                FixVec(5120, 5120),
                                FixVec(-10240, 10240),
                                FixVec(20480, 10240)]
                            , side: [.inner, .inner, .outer, .outer])]),

        // 35
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-5, -5),
                    FixVec(-20, 10),
                    FixVec(20, 10),
                    FixVec(15, -5),
                    FixVec(5, 5),
                    FixVec(0, -15)]
                ),
                points: [
                    FixVec(20, 10),
                    FixVec(15, -5),
                    FixVec(5, 5),
                    FixVec(0, -15),
                    FixVec(-5, -5),
                    FixVec(-20, 10)],
                indices: [3, 4, 2, 4, 5, 2, 5, 0, 2, 2, 0, 1],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(5, 5),
                                FixVec(0, -15),
                                FixVec(-5, -5)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5, 5),
                                FixVec(-5, -5),
                                FixVec(-20, 10)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5, 5),
                                FixVec(-20, 10),
                                FixVec(20, 10)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, -5),
                                FixVec(5, 5),
                                FixVec(20, 10)
                            ], side: [.outer, .inner, .outer])]
        ),

        // 36
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-150, 150),
                    FixVec(30, 150),
                    FixVec(50, 50),
                    FixVec(100, -40),
                    FixVec(170, -80),
                    FixVec(90, -100),
                    FixVec(85, -70),
                    FixVec(-50, 20)]
                ),
                points: [
                    FixVec(30, 150),
                    FixVec(50, 50),
                    FixVec(100, -40),
                    FixVec(170, -80),
                    FixVec(90, -100),
                    FixVec(85, -70),
                    FixVec(-50, 20),
                    FixVec(-150, 150)],
                indices: [7, 0, 6, 0, 1, 6, 6, 1, 5, 1, 2, 5, 5, 2, 3, 5, 3, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(50, 50),
                                FixVec(-50, 20),
                                FixVec(-150, 150),
                                FixVec(30, 150)]
                            , side: [.inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(100, -40),
                                FixVec(85, -70),
                                FixVec(-50, 20),
                                FixVec(50, 50)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(90, -100),
                                FixVec(85, -70),
                                FixVec(100, -40),
                                FixVec(170, -80)]
                            , side: [.outer, .inner, .outer, .outer]
                    )]
        ),
        // 37
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-40, 40),
                        FixVec(40, 40),
                        FixVec(40, -40),
                        FixVec(-40, -40)],
                    [
                        FixVec(5, 0),
                        FixVec(10, -10),
                        FixVec(25, 0),
                        FixVec(15, 5)],
                    [
                        FixVec(-15, -25),
                        FixVec(5, -15),
                        FixVec(-5, -5),
                        FixVec(5, 10),
                        FixVec(5, 20),
                        FixVec(-15, 20)]]),
                points: [
                    FixVec(-40, -40),
                    FixVec(-40, 40),
                    FixVec(40, 40),
                    FixVec(40, -40),
                    FixVec(5, -15),
                    FixVec(-5, -5),
                    FixVec(5, 10),
                    FixVec(5, 20),
                    FixVec(-15, 20),
                    FixVec(-15, -25),
                    FixVec(5, 0),
                    FixVec(10, -10),
                    FixVec(25, 0),
                    FixVec(15, 5)],
                indices: [0, 1, 8, 0, 8, 9, 8, 1, 7, 13, 7, 2, 1, 2, 7, 13, 2, 12, 9, 4, 3, 10, 11, 4, 3, 11, 12, 9, 3, 0, 3, 4, 11, 12, 2, 3, 4, 5, 10, 5, 6, 10, 13, 6, 7, 13, 10, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-15, -25),
                                FixVec(-40, -40),
                                FixVec(-40, 40),
                                FixVec(-15, 20)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(40, 40),
                                FixVec(5, 20),
                                FixVec(-15, 20),
                                FixVec(-40, 40)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, 10),
                                FixVec(5, 20),
                                FixVec(40, 40),
                                FixVec(25, 0),
                                FixVec(15, 5)]
                            , side: [.outer, .inner, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-40, -40),
                                FixVec(-15, -25),
                                FixVec(5, -15),
                                FixVec(40, -40)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-5, -5),
                                FixVec(5, 0),
                                FixVec(10, -10),
                                FixVec(5, -15)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, -15),
                                FixVec(10, -10),
                                FixVec(25, 0),
                                FixVec(40, -40)]
                            , side: [.inner, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(40, -40),
                                FixVec(25, 0),
                                FixVec(40, 40)]
                            , side: [.inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15, 5),
                                FixVec(5, 0),
                                FixVec(-5, -5),
                                FixVec(5, 10)]
                            , side: [.outer, .inner, .outer, .inner])]),
        // 38
        TriangulationTest(
            shape: FixShape(paths: [
                    [
                        FixVec(-5, 0),
                        FixVec(-25, 15),
                        FixVec(20, 15),
                        FixVec(20, -15),
                        FixVec(-25, -15)],
                    [
                        FixVec(-15, -10),
                        FixVec(10, -10),
                        FixVec(10, 10),
                        FixVec(-10, 10),
                        FixVec(0, 0)
                    ]]
                ),
                points: [
                    FixVec(-25, -15),
                    FixVec(-5, 0),
                    FixVec(-25, 15),
                    FixVec(20, 15),
                    FixVec(20, -15),
                    FixVec(10, -10),
                    FixVec(10, 10),
                    FixVec(-10, 10),
                    FixVec(0, 0),
                    FixVec(-15, -10)],
                indices: [0, 1, 9, 9, 1, 8, 7, 2, 3, 7, 3, 6, 9, 5, 0, 0, 5, 4, 5, 6, 4, 6, 3, 4, 2, 7, 1, 7, 8, 1],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-15, -10),
                                FixVec(-25, -15),
                                FixVec(-5, 0)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 10),
                                FixVec(-10, 10),
                                FixVec(-25, 15),
                                FixVec(20, 15)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(20, -15),
                                FixVec(-25, -15),
                                FixVec(-15, -10),
                                FixVec(10, -10)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(20, 15),
                                FixVec(20, -15),
                                FixVec(10, -10),
                                FixVec(10, 10)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-5, 0),
                                FixVec(-25, 15),
                                FixVec(-10, 10)]
                            , side: [.inner, .outer, .inner, .outer])]),

        // 39
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-25, 5),
                        FixVec(-30, 20),
                        FixVec(-25, 30),
                        FixVec(-10, 25),
                        FixVec(0, 30),
                        FixVec(15, 15),
                        FixVec(30, 15),
                        FixVec(35, 5),
                        FixVec(30, -10),
                        FixVec(25, -10),
                        FixVec(15, -20),
                        FixVec(15, -30),
                        FixVec(-5, -35),
                        FixVec(-15, -20),
                        FixVec(-40, -25),
                        FixVec(-35, -5)],
                    [
                        FixVec(5, 0),
                        FixVec(10, -10),
                        FixVec(25, 0),
                        FixVec(15, 5)],
                    [
                        FixVec(-15, 0),
                        FixVec(-25, -5),
                        FixVec(-30, -15),
                        FixVec(-15, -10),
                        FixVec(-5, -15),
                        FixVec(0, -25),
                        FixVec(5, -15),
                        FixVec(-5, -5),
                        FixVec(-5, 5),
                        FixVec(5, 10),
                        FixVec(0, 20),
                        FixVec(-5, 15),
                        FixVec(-10, 15),
                        FixVec(-15, 20),
                        FixVec(-20, 10),
                        FixVec(-15, 5)
                    ]
                ]
                ),
                points: [
                    FixVec(-40, -25),
                    FixVec(-35, -5),
                    FixVec(-25, 5),
                    FixVec(-30, 20),
                    FixVec(-25, 30),
                    FixVec(-10, 25),
                    FixVec(0, 30),
                    FixVec(15, 15),
                    FixVec(30, 15),
                    FixVec(35, 5),
                    FixVec(30, -10),
                    FixVec(25, -10),
                    FixVec(15, -20),
                    FixVec(15, -30),
                    FixVec(-5, -35),
                    FixVec(-15, -20),
                    FixVec(-15, -10),
                    FixVec(-5, -15),
                    FixVec(0, -25),
                    FixVec(5, -15),
                    FixVec(-5, -5),
                    FixVec(-5, 5),
                    FixVec(5, 10),
                    FixVec(0, 20),
                    FixVec(-5, 15),
                    FixVec(-10, 15),
                    FixVec(-15, 20),
                    FixVec(-20, 10),
                    FixVec(-15, 5),
                    FixVec(-15, 0),
                    FixVec(-25, -5),
                    FixVec(-30, -15),
                    FixVec(5, 0),
                    FixVec(10, -10),
                    FixVec(25, 0),
                    FixVec(15, 5)],
                indices: [1, 31, 0, 0, 31, 15, 31, 16, 15, 15, 16, 17, 18, 15, 17, 18, 14, 15, 12, 19, 33, 32, 33, 19, 12, 18, 19, 13, 18, 12, 13, 14, 18, 12, 33, 11, 33, 34, 11, 11, 34, 10, 31, 1, 30, 1, 2, 30, 27, 2, 3, 2, 27, 28, 26, 27, 3, 26, 4, 5, 26, 5, 25, 25, 5, 24, 24, 5, 23, 5, 6, 23, 7, 23, 6, 22, 23, 7, 22, 7, 35, 35, 7, 8, 35, 8, 34, 34, 8, 9, 34, 9, 10, 26, 3, 4, 29, 30, 2, 2, 28, 29, 20, 21, 32, 20, 32, 19, 21, 22, 32, 32, 22, 35],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-25, 5),
                                FixVec(-25, -5),
                                FixVec(-30, -15),
                                FixVec(-40, -25),
                                FixVec(-35, -5)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-5, -15),
                                FixVec(-15, -20),
                                FixVec(-40, -25),
                                FixVec(-30, -15),
                                FixVec(-15, -10)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-5, -35),
                                FixVec(-15, -20),
                                FixVec(-5, -15),
                                FixVec(0, -25)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, -25),
                                FixVec(5, -15),
                                FixVec(10, -10),
                                FixVec(25, 0),
                                FixVec(25, -10),
                                FixVec(15, -20)]
                            , side: [.outer, .inner, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-5, 5),
                                FixVec(5, 0),
                                FixVec(10, -10),
                                FixVec(5, -15),
                                FixVec(-5, -5)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-5, -35),
                                FixVec(0, -25),
                                FixVec(15, -20),
                                FixVec(15, -30)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30, 15),
                                FixVec(35, 5),
                                FixVec(30, -10),
                                FixVec(25, -10),
                                FixVec(25, 0)]
                            , side: [.outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-25, 30),
                                FixVec(-15, 20),
                                FixVec(-20, 10),
                                FixVec(-25, 5),
                                FixVec(-30, 20)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-25, -5),
                                FixVec(-25, 5),
                                FixVec(-20, 10),
                                FixVec(-15, 5),
                                FixVec(-15, 0)]
                            , side: [.inner, .inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 20),
                                FixVec(-5, 15),
                                FixVec(-10, 15),
                                FixVec(-15, 20),
                                FixVec(-25, 30),
                                FixVec(-10, 25)]
                            , side: [.outer, .outer, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, 15),
                                FixVec(0, 20),
                                FixVec(-10, 25),
                                FixVec(0, 30)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15, 5),
                                FixVec(5, 10),
                                FixVec(0, 20),
                                FixVec(15, 15)]
                            , side: [.inner, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(25, 0),
                                FixVec(15, 5),
                                FixVec(15, 15),
                                FixVec(30, 15)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, 5),
                                FixVec(5, 0),
                                FixVec(-5, 5),
                                FixVec(5, 10)]
                            , side: [.outer, .inner, .outer, .inner])]),

        // 40
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-5, 10),
                        FixVec(5, 10),
                        FixVec(10, 5),
                        FixVec(10, -5),
                        FixVec(5, -10),
                        FixVec(-5, -10),
                        FixVec(-10, -5),
                        FixVec(-10, 5)],
                    [
                        FixVec(-5, 0),
                        FixVec(0, -5),
                        FixVec(5, 0),
                        FixVec(0, 5)
                    ]]),
                points: [
                    FixVec(-10, -5),
                    FixVec(-10, 5),
                    FixVec(-5, 10),
                    FixVec(5, 10),
                    FixVec(10, 5),
                    FixVec(10, -5),
                    FixVec(5, -10),
                    FixVec(-5, -10),
                    FixVec(-5, 0),
                    FixVec(0, -5),
                    FixVec(5, 0),
                    FixVec(0, 5)],
                indices: [0, 1, 8, 0, 8, 7, 1, 2, 8, 8, 2, 11, 11, 2, 3, 11, 3, 10, 8, 9, 7, 7, 9, 6, 9, 10, 6, 4, 10, 3, 10, 5, 6, 4, 5, 10],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(5, -10),
                                FixVec(-5, -10),
                                FixVec(-10, -5),
                                FixVec(-10, 5),
                                FixVec(-5, 0),
                                FixVec(0, -5)]
                            , side: [.outer, .outer, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5, 10),
                                FixVec(0, 5),
                                FixVec(-5, 0),
                                FixVec(-10, 5),
                                FixVec(-5, 10)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -5),
                                FixVec(5, 0),
                                FixVec(0, 5),
                                FixVec(5, 10),
                                FixVec(10, 5)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -5),
                                FixVec(5, -10),
                                FixVec(0, -5),
                                FixVec(5, 0)]
                            , side: [.outer, .inner, .outer, .inner])]
        ),

        // 41
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-10, -10),
                        FixVec(-10, 10),
                        FixVec(10, 10),
                        FixVec(10, -10)],
                    [
                        FixVec(0, -5),
                        FixVec(5, -5),
                        FixVec(5, 5),
                        FixVec(0, 5)],
                    [
                        FixVec(-5, -5),
                        FixVec(0, -5),
                        FixVec(0, 5),
                        FixVec(-5, 5)]]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(5, -5),
                    FixVec(5, 5),
                    FixVec(-5, 5),
                    FixVec(-5, -5)],
                indices: [0, 1, 7, 7, 1, 6, 6, 1, 5, 1, 2, 5, 7, 4, 0, 0, 4, 3, 4, 5, 3, 5, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5, 5),
                                FixVec(-5, -5),
                                FixVec(-10, -10),
                                FixVec(-10, 10)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 10),
                                FixVec(5, 5),
                                FixVec(-5, 5),
                                FixVec(-10, 10)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(-5, -5),
                                FixVec(5, -5)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 10),
                                FixVec(10, -10),
                                FixVec(5, -5),
                                FixVec(5, 5)]
                            , side: [.outer, .inner, .outer, .inner])]),

        // 42
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(0, 0),
                    FixVec(-5120, 5120),
                    FixVec(-5120, 10240),
                    FixVec(5120, 10240),
                    FixVec(5120, 5120),
                    FixVec(0, 0),
                    FixVec(5120, -5120),
                    FixVec(5120, -10240),
                    FixVec(-5120, -10240),
                    FixVec(-5120, -5120)]
                ),
                points: [
                    FixVec(-5120, -10240),
                    FixVec(-5120, -5120),
                    FixVec(0, 0),
                    FixVec(5120, -5120),
                    FixVec(5120, -10240),
                    FixVec(-5120, 5120),
                    FixVec(-5120, 10240),
                    FixVec(5120, 10240),
                    FixVec(5120, 5120),
                    FixVec(0, 0)],
                indices: [3, 1, 2, 1, 4, 0, 3, 4, 1, 5, 6, 8, 5, 8, 9, 6, 7, 8],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5120, -10240),
                                FixVec(-5120, -5120),
                                FixVec(0, 0),
                                FixVec(5120, -5120),
                                FixVec(5120, -10240)]
                            , side: [.outer, .outer, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5120, 10240),
                                FixVec(5120, 5120),
                                FixVec(0, 0),
                                FixVec(-5120, 5120),
                                FixVec(-5120, 10240)]
                            , side: [.outer, .outer, .outer, .outer, .outer])]),

        // 43
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-15, -10),
                        FixVec(-15, 10),
                        FixVec(15, 10),
                        FixVec(15, -10)],
                    [
                        FixVec(-10, 0),
                        FixVec(-5, -5),
                        FixVec(0, 0),
                        FixVec(-5, 5)],
                    [
                        FixVec(0, 0),
                        FixVec(5, -5),
                        FixVec(10, 0),
                        FixVec(5, 5)
                    ]]),
                points: [
                    FixVec(-15, -10),
                    FixVec(-15, 10),
                    FixVec(15, 10),
                    FixVec(15, -10),
                    FixVec(-10, 0),
                    FixVec(-5, -5),
                    FixVec(0, 0),
                    FixVec(5, -5),
                    FixVec(10, 0),
                    FixVec(5, 5),
                    FixVec(0, 0),
                    FixVec(-5, 5)],
                indices: [0, 1, 4, 4, 1, 11, 10, 11, 9, 11, 1, 9, 1, 2, 9, 9, 2, 8, 4, 5, 0, 6, 7, 5, 5, 7, 0, 0, 7, 3, 7, 8, 3, 8, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-10, 0),
                                FixVec(-15, -10),
                                FixVec(-15, 10)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-5, 5),
                                FixVec(-10, 0),
                                FixVec(-15, 10)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5, 5),
                                FixVec(0, 0),
                                FixVec(-5, 5)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, 10),
                                FixVec(5, 5),
                                FixVec(-5, 5),
                                FixVec(-15, 10)]
                            , side: [.inner, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, 0),
                                FixVec(5, 5),
                                FixVec(15, 10)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-15, -10),
                                FixVec(-10, 0),
                                FixVec(-5, -5)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-5, -5),
                                FixVec(0, 0),
                                FixVec(5, -5)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, -10),
                                FixVec(-15, -10),
                                FixVec(-5, -5),
                                FixVec(5, -5)]
                            , side: [.outer, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, -10),
                                FixVec(5, -5),
                                FixVec(10, 0)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15, -10),
                                FixVec(10, 0),
                                FixVec(15, 10)]
                            , side: [.inner, .inner, .outer])]),

        // 44
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-10, 15),
                        FixVec(10, 15),
                        FixVec(10, -15),
                        FixVec(-10, -15)],
                    [
                        FixVec(-5, 5),
                        FixVec(0, 0),
                        FixVec(5, 5),
                        FixVec(0, 10)],
                    [
                        FixVec(-5, -5),
                        FixVec(0, -10),
                        FixVec(5, -5),
                        FixVec(0, 0)]]
                ),
                points: [
                    FixVec(-10, -15),
                    FixVec(-10, 15),
                    FixVec(10, 15),
                    FixVec(10, -15),
                    FixVec(-5, -5),
                    FixVec(0, -10),
                    FixVec(5, -5),
                    FixVec(0, 0),
                    FixVec(5, 5),
                    FixVec(0, 10),
                    FixVec(-5, 5),
                    FixVec(0, 0)],
                indices: [0, 1, 4, 4, 1, 10, 10, 1, 9, 1, 2, 9, 9, 2, 8, 4, 5, 0, 0, 5, 3, 5, 6, 3, 6, 8, 3, 8, 2, 3, 4, 10, 11, 7, 8, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5, 5),
                                FixVec(-5, -5),
                                FixVec(-10, -15),
                                FixVec(-10, 15)]
                            , side: [.inner, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 10),
                                FixVec(-5, 5),
                                FixVec(-10, 15)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 10),
                                FixVec(-10, 15),
                                FixVec(10, 15)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5, 5),
                                FixVec(0, 10),
                                FixVec(10, 15)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10, -15),
                                FixVec(-5, -5),
                                FixVec(0, -10)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -15),
                                FixVec(-10, -15),
                                FixVec(0, -10)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -15),
                                FixVec(0, -10),
                                FixVec(5, -5)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 15),
                                FixVec(10, -15),
                                FixVec(5, -5),
                                FixVec(5, 5)]
                            , side: [.outer, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-5, -5),
                                FixVec(-5, 5)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, -5),
                                FixVec(0, 0),
                                FixVec(5, 5)]
                            , side: [.outer, .outer, .inner])]),

        // 45
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-10, 10),
                        FixVec(-5, 10),
                        FixVec(0, 5),
                        FixVec(5, 10),
                        FixVec(10, 10),
                        FixVec(10, -10),
                        FixVec(-10, -10)],
                    [
                        FixVec(-5, 0),
                        FixVec(0, -5),
                        FixVec(5, 0),
                        FixVec(0, 5)]]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(-5, 10),
                    FixVec(0, 5),
                    FixVec(-5, 0),
                    FixVec(0, -5),
                    FixVec(5, 0),
                    FixVec(0, 5),
                    FixVec(5, 10),
                    FixVec(10, 10),
                    FixVec(10, -10)],
                indices: [0, 1, 4, 1, 2, 4, 4, 2, 3, 4, 5, 0, 0, 5, 10, 5, 6, 10, 6, 8, 9, 6, 9, 10, 7, 8, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5, 10),
                                FixVec(-5, 0),
                                FixVec(-10, -10),
                                FixVec(-10, 10)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 5),
                                FixVec(-5, 0),
                                FixVec(-5, 10)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-10, -10),
                                FixVec(-5, 0),
                                FixVec(0, -5)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(0, -5)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(0, -5),
                                FixVec(5, 0)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(5, 0),
                                FixVec(5, 10),
                                FixVec(10, 10)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, 0),
                                FixVec(0, 5),
                                FixVec(5, 10)]
                            , side: [.outer, .outer, .inner])]),

        // 46
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-10, 10),
                        FixVec(10, 10),
                        FixVec(10, -10),
                        FixVec(5, -10),
                        FixVec(0, -5),
                        FixVec(-5, -10),
                        FixVec(-10, -10)],
                    [
                        FixVec(-5, 0),
                        FixVec(0, -5),
                        FixVec(5, 0),
                        FixVec(0, 5)]]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(5, -10),
                    FixVec(0, -5),
                    FixVec(5, 0),
                    FixVec(0, 5),
                    FixVec(-5, 0),
                    FixVec(0, -5),
                    FixVec(-5, -10)],
                indices: [0, 1, 8, 0, 8, 10, 8, 1, 7, 1, 2, 7, 7, 2, 6, 10, 8, 9, 5, 6, 4, 4, 6, 3, 6, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5, -10),
                                FixVec(-10, -10),
                                FixVec(-10, 10),
                                FixVec(-5, 0)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 5),
                                FixVec(-5, 0),
                                FixVec(-10, 10)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 5),
                                FixVec(-10, 10),
                                FixVec(10, 10)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(5, 0),
                                FixVec(0, 5),
                                FixVec(10, 10)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, -5),
                                FixVec(-5, -10),
                                FixVec(-5, 0)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(5, -10),
                                FixVec(0, -5),
                                FixVec(5, 0)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(5, 0),
                                FixVec(10, 10)]
                            , side: [.inner, .inner, .outer])]),

        // 47
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-10, 10),
                        FixVec(-5, 10),
                        FixVec(0, 5),
                        FixVec(5, 10),
                        FixVec(10, 10),
                        FixVec(10, -10),
                        FixVec(5, -10),
                        FixVec(0, -5),
                        FixVec(-5, -10),
                        FixVec(-10, -10)],
                    [
                        FixVec(-5, 0),
                        FixVec(0, -5),
                        FixVec(5, 0),
                        FixVec(0, 5)]]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(-5, 10),
                    FixVec(0, 5),
                    FixVec(-5, 0),
                    FixVec(0, -5),
                    FixVec(-5, -10),
                    FixVec(5, 0),
                    FixVec(0, 5),
                    FixVec(5, 10),
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(5, -10),
                    FixVec(0, -5)],
                indices: [0, 1, 4, 0, 4, 6, 1, 2, 4, 4, 2, 3, 6, 4, 5, 13, 7, 12, 10, 7, 9, 7, 11, 12, 10, 11, 7, 8, 9, 7],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5, 10),
                                FixVec(-5, 0),
                                FixVec(-5, -10),
                                FixVec(-10, -10),
                                FixVec(-10, 10)]
                            , side: [.inner, .inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 5),
                                FixVec(-5, 0),
                                FixVec(-5, 10)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -5),
                                FixVec(-5, -10),
                                FixVec(-5, 0)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(5, -10),
                                FixVec(0, -5),
                                FixVec(5, 0)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 5),
                                FixVec(5, 10),
                                FixVec(10, 10),
                                FixVec(5, 0)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5, 0),
                                FixVec(10, 10),
                                FixVec(10, -10)]
                            , side: [.inner, .outer, .inner])]),

        // 48
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(0, 5),
                    FixVec(5, 0),
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(-10, -10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(0, 5),
                    FixVec(5, 0),
                    FixVec(10, 10),
                    FixVec(10, -10)],
                indices: [0, 1, 3, 1, 2, 3, 3, 4, 0, 0, 4, 6, 4, 5, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(-10, 10),
                                FixVec(0, 5),
                                FixVec(5, 0)]
                            , side: [.outer, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 5),
                                FixVec(-10, 10),
                                FixVec(10, 10)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(5, 0),
                                FixVec(10, 10)]
                            , side: [.inner, .outer, .outer])]),

        // 49
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(5, 0),
                    FixVec(0, -5),
                    FixVec(10, -10),
                    FixVec(-10, -10),
                    FixVec(-10, 10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(5, 0),
                    FixVec(0, -5),
                    FixVec(10, -10)],
                indices: [0, 1, 5, 5, 1, 4, 1, 2, 4, 4, 2, 3, 0, 5, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(10, 10),
                                FixVec(5, 0),
                                FixVec(0, -5),
                                FixVec(-10, -10),
                                FixVec(-10, 10)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(5, 0),
                                FixVec(10, 10)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(0, -5)]
                            , side: [.outer, .inner, .outer])]),

        // 50
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(-10, -10),
                    FixVec(0, -5),
                    FixVec(-5, 0),
                    FixVec(-10, -10),
                    FixVec(-10, 10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(-10, -10),
                    FixVec(0, -5),
                    FixVec(-5, 0)],
                indices: [0, 1, 6, 6, 1, 2, 6, 2, 5, 4, 5, 3, 5, 2, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5, 0),
                                FixVec(-10, -10),
                                FixVec(-10, 10)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(0, -5),
                                FixVec(-5, 0),
                                FixVec(-10, 10),
                                FixVec(10, 10)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(0, -5)]
                            , side: [.outer, .outer, .inner])]),

        // 51
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(-10, 10),
                    FixVec(-5, 0),
                    FixVec(0, 5),
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(10, -10),
                    FixVec(-10, -10)]
                ),
                points: [
                    FixVec(-10, -10),
                    FixVec(-10, 10),
                    FixVec(-5, 0),
                    FixVec(0, 5),
                    FixVec(-10, 10),
                    FixVec(10, 10),
                    FixVec(10, -10)],
                indices: [1, 2, 0, 2, 3, 6, 2, 6, 0, 3, 5, 6, 4, 5, 3],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-10, -10),
                                FixVec(-10, 10),
                                FixVec(-5, 0)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10, 10),
                                FixVec(10, -10),
                                FixVec(-10, -10),
                                FixVec(-5, 0),
                                FixVec(0, 5)]
                            , side: [.outer, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 5),
                                FixVec(-10, 10),
                                FixVec(10, 10)]
                            , side: [.outer, .outer, .inner])]),

        // 52
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(10240, 10240),
                    FixVec(10240, -5120),
                    FixVec(1024, 0),
                    FixVec(5120, -5120),
                    FixVec(3072, -5120),
                    FixVec(5120, -10240),
                    FixVec(-10240, -10240)]
                ),
                points: [
                    FixVec(10240, 10240),
                    FixVec(10240, -5120),
                    FixVec(1024, 0),
                    FixVec(5120, -5120),
                    FixVec(3072, -5120),
                    FixVec(5120, -10240),
                    FixVec(-10240, -10240)],
                indices: [6, 0, 2, 2, 0, 1, 2, 4, 6, 6, 4, 5, 2, 3, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(1024, 0),
                                FixVec(-10240, -10240),
                                FixVec(10240, 10240)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10240, -5120),
                                FixVec(1024, 0),
                                FixVec(10240, 10240)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5120, -10240),
                                FixVec(-10240, -10240),
                                FixVec(1024, 0),
                                FixVec(3072, -5120)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(3072, -5120),
                                FixVec(1024, 0),
                                FixVec(5120, -5120)]
                            , side: [.inner, .outer, .outer])]),

        // 53
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(10240, 8192),
                    FixVec(15360, -1024),
                    FixVec(6144, 3072),
                    FixVec(10240, 0),
                    FixVec(8192, 0),
                    FixVec(9216, -2048),
                    FixVec(-5120, -2048)]
                ),
                points: [
                    FixVec(10240, 8192),
                    FixVec(15360, -1024),
                    FixVec(6144, 3072),
                    FixVec(10240, 0),
                    FixVec(8192, 0),
                    FixVec(9216, -2048),
                    FixVec(-5120, -2048)],
                indices: [6, 0, 2, 2, 0, 1, 2, 4, 6, 6, 4, 5, 2, 3, 4],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(6144, 3072),
                                FixVec(-5120, -2048),
                                FixVec(10240, 8192)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15360, -1024),
                                FixVec(6144, 3072),
                                FixVec(10240, 8192)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(9216, -2048),
                                FixVec(-5120, -2048),
                                FixVec(6144, 3072),
                                FixVec(8192, 0)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(8192, 0),
                                FixVec(6144, 3072),
                                FixVec(10240, 0)]
                            , side: [.inner, .outer, .outer])]),

        // 54
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(10854, 8499),
                    FixVec(10035, 5529),
                    FixVec(14540, 3481),
                    FixVec(13312, 0),
                    FixVec(14540, 1228),
                    FixVec(15564, -1228),
                    FixVec(6348, 2457),
                    FixVec(10854, -512),
                    FixVec(8089, 1024),
                    FixVec(8806, -2048),
                    FixVec(4300, -1740),
                    FixVec(4300, -5222),
                    FixVec(-921, -5734),
                    FixVec(0, -3993),
                    FixVec(-3686, -4300),
                    FixVec(-2150, -1536),
                    FixVec(-5120, -1740),
                    FixVec(-2867, -307),
                    FixVec(-3686, 2048),
                    FixVec(-10956, 4300),
                    FixVec(-12185, 1024),
                    FixVec(-14438, 3993),
                    FixVec(-11673, 3481),
                    FixVec(-11161, 6758),
                    FixVec(-6451, 7475),
                    FixVec(-1228, 3788),
                    FixVec(8294, 4300)]
                ),
                points: [
                    FixVec(-11673, 3481),
                    FixVec(-11161, 6758),
                    FixVec(-6451, 7475),
                    FixVec(-1228, 3788),
                    FixVec(8294, 4300),
                    FixVec(10854, 8499),
                    FixVec(10035, 5529),
                    FixVec(14540, 3481),
                    FixVec(13312, 0),
                    FixVec(14540, 1228),
                    FixVec(15564, -1228),
                    FixVec(6348, 2457),
                    FixVec(10854, -512),
                    FixVec(8089, 1024),
                    FixVec(8806, -2048),
                    FixVec(4300, -1740),
                    FixVec(4300, -5222),
                    FixVec(-921, -5734),
                    FixVec(0, -3993),
                    FixVec(-3686, -4300),
                    FixVec(-2150, -1536),
                    FixVec(-5120, -1740),
                    FixVec(-2867, -307),
                    FixVec(-3686, 2048),
                    FixVec(-10956, 4300),
                    FixVec(-12185, 1024),
                    FixVec(-14438, 3993)],
                indices: [26, 0, 25, 25, 0, 24, 0, 1, 24, 1, 2, 24, 24, 2, 23, 22, 23, 3, 2, 3, 23, 22, 3, 20, 21, 22, 20, 19, 20, 18, 15, 20, 3, 15, 18, 20, 18, 15, 16, 15, 3, 11, 3, 4, 11, 4, 6, 8, 4, 8, 11, 11, 8, 10, 8, 9, 10, 17, 18, 16, 11, 13, 15, 15, 13, 14, 11, 12, 13, 4, 5, 6, 6, 7, 8],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-12185, 1024),
                                FixVec(-14438, 3993),
                                FixVec(-11673, 3481)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10956, 4300),
                                FixVec(-12185, 1024),
                                FixVec(-11673, 3481)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10956, 4300),
                                FixVec(-11673, 3481),
                                FixVec(-11161, 6758)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-1228, 3788),
                                FixVec(-3686, 2048),
                                FixVec(-10956, 4300),
                                FixVec(-11161, 6758),
                                FixVec(-6451, 7475)]
                            , side: [.inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(4300, -5222),
                                FixVec(0, -3993),
                                FixVec(-2150, -1536),
                                FixVec(-2867, -307),
                                FixVec(-3686, 2048),
                                FixVec(-1228, 3788),
                                FixVec(4300, -1740)]
                            , side: [.inner, .inner, .inner, .outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-2150, -1536),
                                FixVec(-5120, -1740),
                                FixVec(-2867, -307)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, -3993),
                                FixVec(-3686, -4300),
                                FixVec(-2150, -1536)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(8806, -2048),
                                FixVec(4300, -1740),
                                FixVec(-1228, 3788),
                                FixVec(6348, 2457),
                                FixVec(8089, 1024)]
                            , side: [.outer, .inner, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(6348, 2457),
                                FixVec(-1228, 3788),
                                FixVec(8294, 4300)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(14540, 3481),
                                FixVec(13312, 0),
                                FixVec(6348, 2457),
                                FixVec(8294, 4300),
                                FixVec(10035, 5529)]
                            , side: [.outer, .inner, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15564, -1228),
                                FixVec(6348, 2457),
                                FixVec(13312, 0)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15564, -1228),
                                FixVec(13312, 0),
                                FixVec(14540, 1228)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(4300, -5222),
                                FixVec(-921, -5734),
                                FixVec(0, -3993)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(8089, 1024),
                                FixVec(6348, 2457),
                                FixVec(10854, -512)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10035, 5529),
                                FixVec(8294, 4300),
                                FixVec(10854, 8499)]
                            , side: [.inner, .outer, .outer])]),

        // 55
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-30, 0),
                        FixVec(-30, 30),
                        FixVec(0, 30),
                        FixVec(30, 30),
                        FixVec(15, 0),
                        FixVec(30, -30),
                        FixVec(0, -30),
                        FixVec(-30, -30)],
                    [
                        FixVec(-15, -15),
                        FixVec(18, -15),
                        FixVec(10, 15),
                        FixVec(-15, 15)]]
                ),
                points: [
                    FixVec(-30, -30),
                    FixVec(-30, 30),
                    FixVec(30, 30),
                    FixVec(15, 0),
                    FixVec(30, -30),
                    FixVec(18, -15),
                    FixVec(10, 15),
                    FixVec(-15, 15),
                    FixVec(-15, -15)],
                indices: [0, 1, 8, 8, 1, 7, 7, 1, 6, 1, 2, 6, 6, 2, 3, 8, 5, 4, 8, 4, 0, 6, 3, 5, 3, 4, 5],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-15, 15),
                                FixVec(-15, -15),
                                FixVec(-30, -30),
                                FixVec(-30, 30)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(30, 30),
                                FixVec(10, 15),
                                FixVec(-15, 15),
                                FixVec(-30, 30)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15, 0),
                                FixVec(10, 15),
                                FixVec(30, 30)]
                            , side: [.inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-30, -30),
                                FixVec(-15, -15),
                                FixVec(18, -15),
                                FixVec(30, -30)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(18, -15),
                                FixVec(10, 15),
                                FixVec(15, 0)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(18, -15),
                                FixVec(15, 0),
                                FixVec(30, -30)]
                            , side: [.inner, .outer, .inner])]),

        // 56
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-15, 0),
                        FixVec(-30, 30),
                        FixVec(30, 30),
                        FixVec(30, -30),
                        FixVec(0, -30),
                        FixVec(-30, -30)],
                    [
                        FixVec(10, -8),
                        FixVec(-10, -13),
                        FixVec(19, -11),
                        FixVec(-12, 15),
                        FixVec(19, 18),
                        FixVec(-20, 18)]]
                ),
                points: [
                    FixVec(-30, -30),
                    FixVec(-15, 0),
                    FixVec(-30, 30),
                    FixVec(30, 30),
                    FixVec(30, -30),
                    FixVec(-20, 18),
                    FixVec(10, -8),
                    FixVec(-10, -13),
                    FixVec(19, -11),
                    FixVec(-12, 15),
                    FixVec(19, 18)],
                indices: [1, 7, 0, 7, 8, 4, 7, 4, 0, 8, 10, 3, 8, 3, 4, 5, 2, 10, 2, 3, 10, 2, 5, 1, 1, 5, 6, 1, 6, 7, 9, 10, 8],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-30, -30),
                                FixVec(-15, 0),
                                FixVec(-10, -13)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-30, -30),
                                FixVec(-10, -13),
                                FixVec(19, -11),
                                FixVec(30, -30)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30, -30),
                                FixVec(19, -11),
                                FixVec(19, 18),
                                FixVec(30, 30)]
                            , side: [.inner, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30, 30),
                                FixVec(19, 18),
                                FixVec(-20, 18),
                                FixVec(-30, 30)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-15, 0),
                                FixVec(-30, 30),
                                FixVec(-20, 18)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10, -13),
                                FixVec(-15, 0),
                                FixVec(-20, 18),
                                FixVec(10, -8)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(19, -11),
                                FixVec(-12, 15),
                                FixVec(19, 18)]
                            , side: [.outer, .outer, .inner])]),

        // 57
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-15, 0),
                        FixVec(-30, 30),
                        FixVec(0, 15),
                        FixVec(30, 30),
                        FixVec(15, 0),
                        FixVec(30, -30),
                        FixVec(0, -15),
                        FixVec(-30, -30)],
                    [
                        FixVec(-10, 0),
                        FixVec(0, -10),
                        FixVec(10, 0),
                        FixVec(0, 10)]]
                ),
                points: [
                    FixVec(-30, -30),
                    FixVec(-15, 0),
                    FixVec(-30, 30),
                    FixVec(0, 15),
                    FixVec(30, 30),
                    FixVec(15, 0),
                    FixVec(30, -30),
                    FixVec(0, -15),
                    FixVec(-10, 0),
                    FixVec(0, -10),
                    FixVec(10, 0),
                    FixVec(0, 10)],
                indices: [1, 8, 7, 1, 7, 0, 8, 9, 7, 9, 10, 7, 10, 5, 7, 7, 5, 6, 3, 1, 2, 1, 11, 8, 3, 11, 1, 11, 3, 10, 10, 3, 5, 3, 4, 5],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(0, -10),
                                FixVec(0, -15),
                                FixVec(-30, -30),
                                FixVec(-15, 0),
                                FixVec(-10, 0)]
                            , side: [.inner, .outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30, -30),
                                FixVec(0, -15),
                                FixVec(0, -10),
                                FixVec(10, 0),
                                FixVec(15, 0)]
                            , side: [.outer, .inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-10, 0),
                                FixVec(-15, 0),
                                FixVec(-30, 30),
                                FixVec(0, 15),
                                FixVec(0, 10)]
                            , side: [.inner, .outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30, 30),
                                FixVec(15, 0),
                                FixVec(10, 0),
                                FixVec(0, 10),
                                FixVec(0, 15)]
                            , side: [.outer, .inner, .outer, .inner, .outer])]),

        // 58
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-15, 0),
                        FixVec(-30, 30),
                        FixVec(0, 15),
                        FixVec(30, 30),
                        FixVec(15, 0),
                        FixVec(30, -30),
                        FixVec(0, -15),
                        FixVec(-30, -30)],
                    [
                        FixVec(-10, 0),
                        FixVec(-20, -20),
                        FixVec(0, -10),
                        FixVec(20, -20),
                        FixVec(10, 0),
                        FixVec(20, 20),
                        FixVec(0, 10),
                        FixVec(-20, 20)]]
                ),
                points: [
                    FixVec(-30, -30),
                    FixVec(-15, 0),
                    FixVec(-30, 30),
                    FixVec(0, 15),
                    FixVec(30, 30),
                    FixVec(15, 0),
                    FixVec(30, -30),
                    FixVec(0, -15),
                    FixVec(0, -10),
                    FixVec(20, -20),
                    FixVec(10, 0),
                    FixVec(20, 20),
                    FixVec(0, 10),
                    FixVec(-20, 20),
                    FixVec(-10, 0),
                    FixVec(-20, -20)],
                indices: [0, 1, 15, 15, 1, 14, 13, 2, 3, 13, 3, 12, 12, 3, 11, 3, 4, 11, 0, 15, 7, 15, 8, 7, 8, 9, 7, 7, 9, 6, 2, 13, 1, 13, 14, 1, 10, 11, 5, 5, 11, 4, 10, 5, 9, 5, 6, 9],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-10, 0),
                                FixVec(-20, -20),
                                FixVec(-30, -30),
                                FixVec(-15, 0)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 10),
                                FixVec(-20, 20),
                                FixVec(-30, 30),
                                FixVec(0, 15)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(30, 30),
                                FixVec(20, 20),
                                FixVec(0, 10),
                                FixVec(0, 15)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -10),
                                FixVec(0, -15),
                                FixVec(-30, -30),
                                FixVec(-20, -20)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30, -30),
                                FixVec(0, -15),
                                FixVec(0, -10),
                                FixVec(20, -20)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10, 0),
                                FixVec(-15, 0),
                                FixVec(-30, 30),
                                FixVec(-20, 20)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30, 30),
                                FixVec(15, 0),
                                FixVec(10, 0),
                                FixVec(20, 20)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(30, -30),
                                FixVec(20, -20),
                                FixVec(10, 0),
                                FixVec(15, 0)]
                            , side: [.inner, .outer, .inner, .outer])]),

        // 59
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-20480, -20480),
                        FixVec(-20480, 20480),
                        FixVec(20480, 20480),
                        FixVec(20480, -20480)],
                    [
                        FixVec(0, 20480),
                        FixVec(-10240, 10240),
                        FixVec(0, 0),
                        FixVec(10240, 10240)]]
                ),
                points: [
                    FixVec(-20480, -20480),
                    FixVec(-20480, 20480),
                    FixVec(0, 20480),
                    FixVec(-10240, 10240),
                    FixVec(0, 0),
                    FixVec(10240, 10240),
                    FixVec(0, 20480),
                    FixVec(20480, 20480),
                    FixVec(20480, -20480)],
                indices: [1, 3, 0, 3, 4, 0, 4, 5, 8, 4, 8, 0, 5, 7, 8, 1, 2, 3, 6, 7, 5],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(20480, -20480),
                                FixVec(-20480, -20480),
                                FixVec(-20480, 20480),
                                FixVec(-10240, 10240),
                                FixVec(0, 0)]
                            , side: [.outer, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(20480, 20480),
                                FixVec(20480, -20480),
                                FixVec(0, 0),
                                FixVec(10240, 10240)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10240, 10240),
                                FixVec(-20480, 20480),
                                FixVec(0, 20480)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10240, 10240),
                                FixVec(0, 20480),
                                FixVec(20480, 20480)]
                            , side: [.outer, .outer, .inner])]),

        // 60
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-20480, -20480),
                        FixVec(-20480, 20480),
                        FixVec(20480, 20480),
                        FixVec(20480, -20480)],
                    [
                        FixVec(0, 20480),
                        FixVec(-10240, 10240),
                        FixVec(10240, -10240),
                        FixVec(-10240, -10240),
                        FixVec(10240, 10240)]]
                ),
                points: [
                    FixVec(-20480, -20480),
                    FixVec(-20480, 20480),
                    FixVec(0, 20480),
                    FixVec(-10240, 10240),
                    FixVec(0, 0),
                    FixVec(-10240, -10240),
                    FixVec(10240, -10240),
                    FixVec(0, 0),
                    FixVec(10240, 10240),
                    FixVec(0, 20480),
                    FixVec(20480, 20480),
                    FixVec(20480, -20480)],
                indices: [0, 1, 5, 5, 1, 3, 1, 2, 3, 5, 6, 0, 0, 6, 11, 6, 8, 11, 8, 10, 11, 5, 3, 4, 7, 8, 6, 9, 10, 8],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-10240, -10240),
                                FixVec(-20480, -20480),
                                FixVec(-20480, 20480),
                                FixVec(-10240, 10240)]
                            , side: [.outer, .inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-10240, 10240),
                                FixVec(-20480, 20480),
                                FixVec(0, 20480)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(20480, -20480),
                                FixVec(-20480, -20480),
                                FixVec(-10240, -10240),
                                FixVec(10240, -10240)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(10240, 10240),
                                FixVec(20480, 20480),
                                FixVec(20480, -20480),
                                FixVec(10240, -10240)]
                            , side: [.outer, .inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(10240, 10240),
                                FixVec(0, 20480),
                                FixVec(20480, 20480)]
                            , side: [.outer, .outer, .inner])]),

        // 61
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(-20480, -20480),
                        FixVec(-20480, 20480),
                        FixVec(20480, 20480),
                        FixVec(20480, -20480)],
                    [
                        FixVec(0, 20480),
                        FixVec(-10240, 10240),
                        FixVec(10240, 10240),
                        FixVec(0, 0)]]
                ),
                points: [
                    FixVec(-20480, -20480),
                    FixVec(-20480, 20480),
                    FixVec(0, 20480),
                    FixVec(-10240, 10240),
                    FixVec(0, 10240),
                    FixVec(0, 0),
                    FixVec(10240, 10240),
                    FixVec(0, 10240),
                    FixVec(0, 20480),
                    FixVec(20480, 20480),
                    FixVec(20480, -20480)],
                indices: [1, 3, 0, 3, 5, 0, 5, 6, 10, 5, 10, 0, 6, 9, 10, 1, 2, 3, 3, 4, 5, 7, 8, 6, 8, 9, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(20480, -20480),
                                FixVec(-20480, -20480),
                                FixVec(-20480, 20480),
                                FixVec(-10240, 10240),
                                FixVec(0, 0)]
                            , side: [.outer, .outer, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(20480, 20480),
                                FixVec(20480, -20480),
                                FixVec(0, 0),
                                FixVec(10240, 10240)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10240, 10240),
                                FixVec(-20480, 20480),
                                FixVec(0, 20480)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-10240, 10240),
                                FixVec(0, 10240)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(20480, 20480),
                                FixVec(10240, 10240),
                                FixVec(0, 10240),
                                FixVec(0, 20480)]
                            , side: [.inner, .outer, .outer, .outer])]),

        // 62
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(0, 20480),
                        FixVec(20480, -20480),
                        FixVec(-20480, -20480)],
                    [
                        FixVec(0, 0),
                        FixVec(10240, 0),
                        FixVec(0, -10240),
                        FixVec(10240, -10240)]]
                ),
                points: [
                    FixVec(-20480, -20480),
                    FixVec(0, 20480),
                    FixVec(10240, 0),
                    FixVec(0, 0),
                    FixVec(5120, -5120),
                    FixVec(0, -10240),
                    FixVec(10240, -10240),
                    FixVec(5120, -5120),
                    FixVec(10240, 0),
                    FixVec(20480, -20480)],
                indices: [5, 0, 3, 0, 1, 3, 3, 1, 2, 5, 6, 9, 5, 9, 0, 6, 8, 9, 5, 3, 4, 7, 8, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(5120, -5120),
                                FixVec(0, -10240),
                                FixVec(-20480, -20480),
                                FixVec(0, 0)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, 0),
                                FixVec(-20480, -20480),
                                FixVec(0, 20480)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10240, 0),
                                FixVec(0, 0),
                                FixVec(0, 20480)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-20480, -20480),
                                FixVec(0, -10240),
                                FixVec(10240, -10240),
                                FixVec(20480, -20480)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5120, -5120),
                                FixVec(10240, 0),
                                FixVec(20480, -20480),
                                FixVec(10240, -10240)]
                            , side: [.outer, .outer, .inner, .outer])]),

        // 63
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(0, 20480),
                        FixVec(9216, 1024),
                        FixVec(14336, -15360),
                        FixVec(-14336, -15360)],
                    [
                        FixVec(-4096, -5120),
                        FixVec(9216, 1024),
                        FixVec(2048, -11264),
                        FixVec(5120, -9216)]]
                ),
                points: [
                    FixVec(-14336, -15360),
                    FixVec(0, 20480),
                    FixVec(9216, 1024),
                    FixVec(-4096, -5120),
                    FixVec(3629, -8554),
                    FixVec(2048, -11264),
                    FixVec(5120, -9216),
                    FixVec(3629, -8554),
                    FixVec(9216, 1024),
                    FixVec(14336, -15360)],
                indices: [0, 1, 3, 3, 1, 2, 3, 5, 0, 0, 5, 9, 5, 6, 9, 6, 8, 9, 3, 4, 5, 7, 8, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-4096, -5120),
                                FixVec(-14336, -15360),
                                FixVec(0, 20480)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(9216, 1024),
                                FixVec(-4096, -5120),
                                FixVec(0, 20480)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(3629, -8554),
                                FixVec(2048, -11264),
                                FixVec(-14336, -15360),
                                FixVec(-4096, -5120)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(14336, -15360),
                                FixVec(-14336, -15360),
                                FixVec(2048, -11264)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(14336, -15360),
                                FixVec(2048, -11264),
                                FixVec(5120, -9216)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(14336, -15360),
                                FixVec(5120, -9216),
                                FixVec(9216, 1024)]
                            , side: [.inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5120, -9216),
                                FixVec(3629, -8554),
                                FixVec(9216, 1024)]
                            , side: [.outer, .outer, .inner])]),

        // 64
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(0, 20480),
                        FixVec(9216, 1024),
                        FixVec(26624, -7168),
                        FixVec(14336, -15360),
                        FixVec(-14336, -15360),
                        FixVec(-25600, -7168)],
                    [
                        FixVec(-4096, -5120),
                        FixVec(9216, 1024),
                        FixVec(2048, -11264)]]
                ),
                points: [
                    FixVec(0, 20480),
                    FixVec(9216, 1024),
                    FixVec(-4096, -5120),
                    FixVec(2048, -11264),
                    FixVec(9216, 1024),
                    FixVec(26624, -7168),
                    FixVec(14336, -15360),
                    FixVec(-14336, -15360),
                    FixVec(-25600, -7168)],
                indices: [7, 8, 2, 8, 0, 2, 2, 0, 1, 2, 3, 7, 7, 3, 6, 3, 4, 6, 4, 5, 6],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(2048, -11264),
                                FixVec(-14336, -15360),
                                FixVec(-25600, -7168),
                                FixVec(-4096, -5120)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(9216, 1024),
                                FixVec(-4096, -5120),
                                FixVec(-25600, -7168),
                                FixVec(0, 20480)]
                            , side: [.outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(14336, -15360),
                                FixVec(-14336, -15360),
                                FixVec(2048, -11264)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(26624, -7168),
                                FixVec(14336, -15360),
                                FixVec(2048, -11264),
                                FixVec(9216, 1024)]
                            , side: [.outer, .inner, .outer, .outer])]),

        // 65
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(0, 20480),
                        FixVec(14336, -15360),
                        FixVec(-14336, -15360),
                        FixVec(-18432, 0),
                        FixVec(-7168, 6144),
                        FixVec(-10240, 8192)],
                    [
                        FixVec(-2048, -2048),
                        FixVec(-9216, 10240),
                        FixVec(-2048, -9216)]]
                ),
                points: [
                    FixVec(-7618, 5900),
                    FixVec(-2048, -9216),
                    FixVec(-2048, -2048),
                    FixVec(-8936, 9758),
                    FixVec(0, 20480),
                    FixVec(14336, -15360),
                    FixVec(-14336, -15360),
                    FixVec(-18432, 0),
                    FixVec(-10240, 8192),
                    FixVec(-9007, 9672),
                    FixVec(-7883, 6621),
                    FixVec(-8936, 9758),
                    FixVec(-9007, 9672),
                    FixVec(-9216, 10240),
                    FixVec(-7168, 6144),
                    FixVec(-7618, 5900),
                    FixVec(-7883, 6621)],
                indices: [7, 0, 1, 7, 1, 6, 2, 4, 5, 6, 1, 5, 2, 5, 1, 3, 4, 2, 8, 9, 10, 13, 11, 12, 16, 14, 15],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-14336, -15360),
                                FixVec(-18432, 0),
                                FixVec(-7618, 5900),
                                FixVec(-2048, -9216)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-2048, -9216),
                                FixVec(-2048, -2048),
                                FixVec(0, 20480),
                                FixVec(14336, -15360)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(14336, -15360),
                                FixVec(-14336, -15360),
                                FixVec(-2048, -9216)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-2048, -2048),
                                FixVec(-8936, 9758),
                                FixVec(0, 20480)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-7883, 6621),
                                FixVec(-10240, 8192),
                                FixVec(-9007, 9672)]
                            , side: [.outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-9007, 9672),
                                FixVec(-9216, 10240),
                                FixVec(-8936, 9758)]
                            , side: [.outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-7618, 5900),
                                FixVec(-7883, 6621),
                                FixVec(-7168, 6144)]
                            , side: [.outer, .outer, .outer])]),

        // 66
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(0, 20480),
                        FixVec(8192, 10240),
                        FixVec(7168, 6144),
                        FixVec(9216, 1024),
                        FixVec(13312, -1024),
                        FixVec(17408, 1024),
                        FixVec(26624, -7168),
                        FixVec(14336, -15360),
                        FixVec(0, -18432),
                        FixVec(-14336, -15360),
                        FixVec(-25600, -7168),
                        FixVec(-18432, 0),
                        FixVec(-16384, -3072),
                        FixVec(-13312, -4096),
                        FixVec(-8192, -2048),
                        FixVec(-6144, 2048),
                        FixVec(-7168, 6144),
                        FixVec(-10240, 8192)],
                    [
                        FixVec(2048, 0),
                        FixVec(-2048, -2048),
                        FixVec(-9216, 10240),
                        FixVec(-2048, -9216),
                        FixVec(2048, -11264),
                        FixVec(5120, -9216),
                        FixVec(7168, -5120),
                        FixVec(5120, -2048)]]
                ),
                points: [
                    FixVec(-25600, -7168),
                    FixVec(-18432, 0),
                    FixVec(-16384, -3072),
                    FixVec(-13312, -4096),
                    FixVec(-8192, -2048),
                    FixVec(-6176, 1986),
                    FixVec(-2048, -9216),
                    FixVec(2048, -11264),
                    FixVec(5120, -9216),
                    FixVec(7168, -5120),
                    FixVec(5120, -2048),
                    FixVec(2048, 0),
                    FixVec(-2048, -2048),
                    FixVec(-8936, 9758),
                    FixVec(0, 20480),
                    FixVec(8192, 10240),
                    FixVec(7168, 6144),
                    FixVec(9216, 1024),
                    FixVec(13312, -1024),
                    FixVec(17408, 1024),
                    FixVec(26624, -7168),
                    FixVec(14336, -15360),
                    FixVec(0, -18432),
                    FixVec(-14336, -15360),
                    FixVec(-10240, 8192),
                    FixVec(-9007, 9672),
                    FixVec(-7883, 6621),
                    FixVec(-8936, 9758),
                    FixVec(-9007, 9672),
                    FixVec(-9216, 10240),
                    FixVec(-7883, 6621),
                    FixVec(-7168, 6144),
                    FixVec(-6144, 2048),
                    FixVec(-6176, 1986)],
                indices: [1, 2, 0, 0, 2, 23, 2, 3, 23, 3, 4, 6, 4, 5, 6, 3, 6, 23, 23, 6, 22, 6, 7, 22, 7, 8, 21, 17, 9, 10, 17, 18, 9, 21, 9, 18, 21, 8, 9, 7, 21, 22, 18, 19, 20, 18, 20, 21, 13, 14, 15, 13, 11, 12, 16, 11, 13, 17, 11, 16, 17, 10, 11, 13, 15, 16, 24, 25, 26, 29, 27, 28, 30, 31, 33, 31, 32, 33],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-14336, -15360),
                                FixVec(-25600, -7168),
                                FixVec(-18432, 0),
                                FixVec(-16384, -3072)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(2048, -11264),
                                FixVec(0, -18432),
                                FixVec(-14336, -15360),
                                FixVec(-16384, -3072),
                                FixVec(-13312, -4096),
                                FixVec(-2048, -9216)]
                            , side: [.inner, .outer, .inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-2048, -9216),
                                FixVec(-13312, -4096),
                                FixVec(-8192, -2048)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-2048, -9216),
                                FixVec(-8192, -2048),
                                FixVec(-6176, 1986)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -18432),
                                FixVec(2048, -11264),
                                FixVec(5120, -9216),
                                FixVec(14336, -15360)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(14336, -15360),
                                FixVec(7168, -5120),
                                FixVec(5120, -2048),
                                FixVec(9216, 1024),
                                FixVec(13312, -1024)]
                            , side: [.inner, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(7168, -5120),
                                FixVec(14336, -15360),
                                FixVec(5120, -9216)]
                            , side: [.inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(14336, -15360),
                                FixVec(13312, -1024),
                                FixVec(17408, 1024),
                                FixVec(26624, -7168)]
                            , side: [.inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-2048, -2048),
                                FixVec(-8936, 9758),
                                FixVec(0, 20480),
                                FixVec(8192, 10240),
                                FixVec(7168, 6144),
                                FixVec(2048, 0)]
                            , side: [.outer, .outer, .outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5120, -2048),
                                FixVec(2048, 0),
                                FixVec(7168, 6144),
                                FixVec(9216, 1024)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-7883, 6621),
                                FixVec(-10240, 8192),
                                FixVec(-9007, 9672)]
                            , side: [.outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-9007, 9672),
                                FixVec(-9216, 10240),
                                FixVec(-8936, 9758)]
                            , side: [.outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-6144, 2048),
                                FixVec(-6176, 1986),
                                FixVec(-7883, 6621),
                                FixVec(-7168, 6144)]
                            , side: [.outer, .outer, .outer, .outer])]),

        // 67
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(32768, 0),
                        FixVec(21532, -4283),
                        FixVec(30273, -12539),
                        FixVec(36236, -24212),
                        FixVec(23170, -23170),
                        FixVec(12197, -18254),
                        FixVec(12539, -30273),
                        FixVec(8502, -42744),
                        FixVec(0, -32768),
                        FixVec(-4283, -21532),
                        FixVec(-12539, -30273),
                        FixVec(-24212, -36236),
                        FixVec(-23170, -23170),
                        FixVec(-18254, -12197),
                        FixVec(-30273, -12539),
                        FixVec(-42744, -8502),
                        FixVec(-32768, 0),
                        FixVec(-21532, 4283),
                        FixVec(-30273, 12539),
                        FixVec(-36236, 24212),
                        FixVec(-23170, 23170),
                        FixVec(-12197, 18254),
                        FixVec(-12539, 30273),
                        FixVec(-8502, 42744),
                        FixVec(0, 32768),
                        FixVec(4283, 21532),
                        FixVec(12539, 30273),
                        FixVec(24212, 36236),
                        FixVec(23170, 23170),
                        FixVec(18254, 12197),
                        FixVec(30273, 12539),
                        FixVec(42744, 8502)],
                    [
                        FixVec(21372, 4251),
                        FixVec(15136, 6269),
                        FixVec(9127, 6098),
                        FixVec(11585, 11585),
                        FixVec(12106, 18118),
                        FixVec(6269, 15136),
                        FixVec(2141, 10766),
                        FixVec(0, 16384),
                        FixVec(-4251, 21372),
                        FixVec(-6269, 15136),
                        FixVec(-6098, 9127),
                        FixVec(-11585, 11585),
                        FixVec(-18118, 12106),
                        FixVec(-15136, 6269),
                        FixVec(-10766, 2141),
                        FixVec(-16384, 0),
                        FixVec(-21372, -4251),
                        FixVec(-15136, -6269),
                        FixVec(-9127, -6098),
                        FixVec(-11585, -11585),
                        FixVec(-12106, -18118),
                        FixVec(-6269, -15136),
                        FixVec(-2141, -10766),
                        FixVec(0, -16384),
                        FixVec(4251, -21372),
                        FixVec(6269, -15136),
                        FixVec(6098, -9127),
                        FixVec(11585, -11585),
                        FixVec(18118, -12106),
                        FixVec(15136, -6269),
                        FixVec(10766, -2141),
                        FixVec(16384, 0)]]
                ),
                points: [
                    FixVec(-42744, -8502),
                    FixVec(-32768, 0),
                    FixVec(-21532, 4283),
                    FixVec(-30273, 12539),
                    FixVec(-36236, 24212),
                    FixVec(-23170, 23170),
                    FixVec(-12197, 18254),
                    FixVec(-12539, 30273),
                    FixVec(-8502, 42744),
                    FixVec(0, 32768),
                    FixVec(4283, 21532),
                    FixVec(12539, 30273),
                    FixVec(24212, 36236),
                    FixVec(23170, 23170),
                    FixVec(18254, 12197),
                    FixVec(30273, 12539),
                    FixVec(42744, 8502),
                    FixVec(32768, 0),
                    FixVec(21532, -4283),
                    FixVec(30273, -12539),
                    FixVec(36236, -24212),
                    FixVec(23170, -23170),
                    FixVec(12197, -18254),
                    FixVec(12539, -30273),
                    FixVec(8502, -42744),
                    FixVec(0, -32768),
                    FixVec(-4283, -21532),
                    FixVec(-12539, -30273),
                    FixVec(-24212, -36236),
                    FixVec(-23170, -23170),
                    FixVec(-18254, -12197),
                    FixVec(-30273, -12539),
                    FixVec(-15136, -6269),
                    FixVec(-9127, -6098),
                    FixVec(-11585, -11585),
                    FixVec(-12106, -18118),
                    FixVec(-6269, -15136),
                    FixVec(-2141, -10766),
                    FixVec(0, -16384),
                    FixVec(4251, -21372),
                    FixVec(6269, -15136),
                    FixVec(6098, -9127),
                    FixVec(11585, -11585),
                    FixVec(18118, -12106),
                    FixVec(15136, -6269),
                    FixVec(10766, -2141),
                    FixVec(16384, 0),
                    FixVec(21372, 4251),
                    FixVec(15136, 6269),
                    FixVec(9127, 6098),
                    FixVec(11585, 11585),
                    FixVec(12106, 18118),
                    FixVec(6269, 15136),
                    FixVec(2141, 10766),
                    FixVec(0, 16384),
                    FixVec(-4251, 21372),
                    FixVec(-6269, 15136),
                    FixVec(-6098, 9127),
                    FixVec(-11585, 11585),
                    FixVec(-18118, 12106),
                    FixVec(-15136, 6269),
                    FixVec(-10766, 2141),
                    FixVec(-16384, 0),
                    FixVec(-21372, -4251)],
                indices: [0, 1, 31, 1, 2, 63, 1, 63, 31, 31, 63, 30, 63, 32, 30, 4, 5, 3, 59, 3, 5, 60, 2, 59, 59, 2, 3, 5, 6, 59, 59, 6, 58, 35, 29, 30, 34, 30, 32, 29, 27, 28, 35, 27, 29, 34, 35, 30, 32, 33, 34, 2, 62, 63, 60, 62, 2, 62, 60, 61, 9, 7, 8, 55, 6, 7, 56, 58, 6, 58, 56, 57, 35, 36, 26, 35, 26, 27, 38, 36, 37, 38, 26, 36, 39, 26, 38, 39, 25, 26, 23, 25, 39, 39, 40, 22, 55, 56, 6, 9, 55, 7, 10, 55, 9, 10, 54, 55, 52, 54, 10, 52, 53, 54, 52, 10, 51, 10, 11, 51, 40, 41, 42, 22, 40, 42, 39, 22, 23, 23, 24, 25, 49, 50, 48, 50, 51, 14, 13, 51, 11, 50, 14, 48, 13, 14, 51, 11, 12, 13, 45, 46, 44, 44, 46, 18, 46, 47, 18, 42, 43, 22, 44, 18, 43, 22, 43, 21, 43, 18, 19, 43, 19, 21, 21, 19, 20, 48, 14, 47, 14, 15, 47, 47, 15, 17, 47, 17, 18, 15, 16, 17],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-18254, -12197),
                                FixVec(-30273, -12539),
                                FixVec(-42744, -8502),
                                FixVec(-32768, 0),
                                FixVec(-21372, -4251)]
                            , side: [.outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-15136, 6269),
                                FixVec(-16384, 0),
                                FixVec(-21372, -4251),
                                FixVec(-32768, 0),
                                FixVec(-21532, 4283)]
                            , side: [.inner, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-12106, -18118),
                                FixVec(-18254, -12197),
                                FixVec(-21372, -4251),
                                FixVec(-15136, -6269),
                                FixVec(-11585, -11585)]
                            , side: [.inner, .inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-21532, 4283),
                                FixVec(-30273, 12539),
                                FixVec(-36236, 24212),
                                FixVec(-23170, 23170),
                                FixVec(-18118, 12106)]
                            , side: [.outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-18118, 12106),
                                FixVec(-15136, 6269),
                                FixVec(-21532, 4283)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-6269, 15136),
                                FixVec(-11585, 11585),
                                FixVec(-18118, 12106),
                                FixVec(-23170, 23170),
                                FixVec(-12197, 18254)]
                            , side: [.inner, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-24212, -36236),
                                FixVec(-23170, -23170),
                                FixVec(-18254, -12197),
                                FixVec(-12106, -18118),
                                FixVec(-12539, -30273)]
                            , side: [.outer, .outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-11585, -11585),
                                FixVec(-15136, -6269),
                                FixVec(-9127, -6098)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-10766, 2141),
                                FixVec(-16384, 0),
                                FixVec(-15136, 6269)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-12197, 18254),
                                FixVec(-12539, 30273),
                                FixVec(-8502, 42744),
                                FixVec(0, 32768),
                                FixVec(-4251, 21372)]
                            , side: [.outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-6098, 9127),
                                FixVec(-11585, 11585),
                                FixVec(-6269, 15136)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -16384),
                                FixVec(-4283, -21532),
                                FixVec(-12539, -30273),
                                FixVec(-12106, -18118),
                                FixVec(-6269, -15136)]
                            , side: [.inner, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-2141, -10766),
                                FixVec(0, -16384),
                                FixVec(-6269, -15136)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -32768),
                                FixVec(-4283, -21532),
                                FixVec(0, -16384),
                                FixVec(4251, -21372)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(8502, -42744),
                                FixVec(0, -32768),
                                FixVec(4251, -21372),
                                FixVec(12197, -18254),
                                FixVec(12539, -30273)]
                            , side: [.outer, .inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(18118, -12106),
                                FixVec(12197, -18254),
                                FixVec(4251, -21372),
                                FixVec(6269, -15136),
                                FixVec(11585, -11585)]
                            , side: [.inner, .inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-12197, 18254),
                                FixVec(-4251, 21372),
                                FixVec(-6269, 15136)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(6269, 15136),
                                FixVec(0, 16384),
                                FixVec(-4251, 21372),
                                FixVec(0, 32768),
                                FixVec(4283, 21532)]
                            , side: [.inner, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(0, 16384),
                                FixVec(6269, 15136),
                                FixVec(2141, 10766)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(12539, 30273),
                                FixVec(12106, 18118),
                                FixVec(6269, 15136),
                                FixVec(4283, 21532)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(11585, -11585),
                                FixVec(6269, -15136),
                                FixVec(6098, -9127)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(18254, 12197),
                                FixVec(15136, 6269),
                                FixVec(9127, 6098),
                                FixVec(11585, 11585)]
                            , side: [.inner, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(23170, 23170),
                                FixVec(18254, 12197),
                                FixVec(11585, 11585),
                                FixVec(12106, 18118)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(24212, 36236),
                                FixVec(23170, 23170),
                                FixVec(12106, 18118),
                                FixVec(12539, 30273)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(21532, -4283),
                                FixVec(15136, -6269),
                                FixVec(10766, -2141),
                                FixVec(16384, 0)]
                            , side: [.inner, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(32768, 0),
                                FixVec(21532, -4283),
                                FixVec(16384, 0),
                                FixVec(21372, 4251)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(30273, -12539),
                                FixVec(18118, -12106),
                                FixVec(15136, -6269),
                                FixVec(21532, -4283)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(36236, -24212),
                                FixVec(23170, -23170),
                                FixVec(12197, -18254),
                                FixVec(18118, -12106),
                                FixVec(30273, -12539)]
                            , side: [.outer, .outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30273, 12539),
                                FixVec(21372, 4251),
                                FixVec(15136, 6269),
                                FixVec(18254, 12197)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(42744, 8502),
                                FixVec(32768, 0),
                                FixVec(21372, 4251),
                                FixVec(30273, 12539)]
                            , side: [.outer, .inner, .inner, .outer])]),
        // 68
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(32768, 0),
                        FixVec(17033, -3388),
                        FixVec(30273, -12539),
                        FixVec(40051, -26761),
                        FixVec(23170, -23170),
                        FixVec(9648, -14440),
                        FixVec(12539, -30273),
                        FixVec(9397, -47243),
                        FixVec(0, -32768),
                        FixVec(-3388, -17033),
                        FixVec(-12539, -30273),
                        FixVec(-26761, -40051),
                        FixVec(-23170, -23170),
                        FixVec(-14440, -9648),
                        FixVec(-30273, -12539),
                        FixVec(-47243, -9397),
                        FixVec(-32768, 0),
                        FixVec(-17033, 3388),
                        FixVec(-30273, 12539),
                        FixVec(-40051, 26761),
                        FixVec(-23170, 23170),
                        FixVec(-9648, 14440),
                        FixVec(-12539, 30273),
                        FixVec(-9397, 47243),
                        FixVec(0, 32768),
                        FixVec(3388, 17033),
                        FixVec(12539, 30273),
                        FixVec(26761, 40050),
                        FixVec(23170, 23170),
                        FixVec(14440, 9648),
                        FixVec(30273, 12539),
                        FixVec(47243, 9397)],
                    [
                        FixVec(23621, 4698),
                        FixVec(15136, 6269),
                        FixVec(7220, 4824),
                        FixVec(11585, 11585),
                        FixVec(13380, 20025),
                        FixVec(6269, 15136),
                        FixVec(1694, 8516),
                        FixVec(0, 16384),
                        FixVec(-4698, 23621),
                        FixVec(-6269, 15136),
                        FixVec(-4824, 7220),
                        FixVec(-11585, 11585),
                        FixVec(-20025, 13380),
                        FixVec(-15136, 6269),
                        FixVec(-8516, 1694),
                        FixVec(-16384, 0),
                        FixVec(-23621, -4698),
                        FixVec(-15136, -6269),
                        FixVec(-7220, -4824),
                        FixVec(-11585, -11585),
                        FixVec(-13380, -20025),
                        FixVec(-6269, -15136),
                        FixVec(-1694, -8516),
                        FixVec(0, -16384),
                        FixVec(4698, -23621),
                        FixVec(6269, -15136),
                        FixVec(4824, -7220),
                        FixVec(11585, -11585),
                        FixVec(20025, -13380),
                        FixVec(15136, -6269),
                        FixVec(8516, -1694),
                        FixVec(16384, 0)]]
                ),
                points: [
                    FixVec(-47243, -9397),
                    FixVec(-32768, 0),
                    FixVec(-17033, 3388),
                    FixVec(-30273, 12539),
                    FixVec(-40051, 26761),
                    FixVec(-23170, 23170),
                    FixVec(-9648, 14440),
                    FixVec(-12539, 30273),
                    FixVec(-9397, 47243),
                    FixVec(0, 32768),
                    FixVec(3388, 17033),
                    FixVec(12539, 30273),
                    FixVec(26761, 40050),
                    FixVec(23170, 23170),
                    FixVec(14440, 9648),
                    FixVec(30273, 12539),
                    FixVec(47243, 9397),
                    FixVec(32768, 0),
                    FixVec(17033, -3388),
                    FixVec(30273, -12539),
                    FixVec(40051, -26761),
                    FixVec(23170, -23170),
                    FixVec(9648, -14440),
                    FixVec(12539, -30273),
                    FixVec(9397, -47243),
                    FixVec(0, -32768),
                    FixVec(-3388, -17033),
                    FixVec(-12539, -30273),
                    FixVec(-26761, -40051),
                    FixVec(-23170, -23170),
                    FixVec(-14440, -9648),
                    FixVec(-30273, -12539),
                    FixVec(-15136, -6269),
                    FixVec(-7220, -4824),
                    FixVec(-11585, -11585),
                    FixVec(-13380, -20025),
                    FixVec(-6269, -15136),
                    FixVec(-1694, -8516),
                    FixVec(0, -16384),
                    FixVec(4698, -23621),
                    FixVec(6269, -15136),
                    FixVec(4824, -7220),
                    FixVec(11585, -11585),
                    FixVec(20025, -13380),
                    FixVec(15136, -6269),
                    FixVec(8516, -1694),
                    FixVec(16384, 0),
                    FixVec(23621, 4698),
                    FixVec(15136, 6269),
                    FixVec(7220, 4824),
                    FixVec(11585, 11585),
                    FixVec(13380, 20025),
                    FixVec(6269, 15136),
                    FixVec(1694, 8516),
                    FixVec(0, 16384),
                    FixVec(-4698, 23621),
                    FixVec(-6269, 15136),
                    FixVec(-4824, 7220),
                    FixVec(-11585, 11585),
                    FixVec(-20025, 13380),
                    FixVec(-15136, 6269),
                    FixVec(-8516, 1694),
                    FixVec(-16384, 0),
                    FixVec(-23621, -4698)],
                indices: [0, 1, 31, 31, 1, 63, 1, 2, 63, 63, 2, 62, 4, 5, 3, 5, 59, 3, 3, 59, 2, 59, 60, 2, 2, 60, 61, 2, 61, 62, 29, 30, 35, 27, 29, 35, 27, 28, 29, 35, 36, 26, 35, 26, 27, 36, 37, 26, 26, 37, 38, 39, 26, 38, 39, 25, 26, 25, 39, 23, 39, 40, 22, 63, 32, 30, 63, 30, 31, 35, 30, 34, 30, 32, 33, 30, 33, 34, 59, 5, 6, 59, 6, 58, 6, 7, 55, 6, 56, 57, 6, 57, 58, 9, 7, 8, 6, 55, 56, 9, 55, 7, 10, 55, 9, 10, 54, 55, 54, 10, 53, 53, 10, 52, 10, 11, 51, 10, 51, 52, 51, 11, 13, 51, 13, 14, 11, 12, 13, 23, 39, 22, 40, 41, 22, 41, 42, 22, 42, 43, 22, 22, 43, 21, 51, 14, 50, 50, 14, 49, 49, 14, 48, 48, 14, 47, 14, 15, 47, 45, 46, 18, 45, 18, 44, 44, 18, 43, 43, 18, 19, 43, 19, 21, 21, 19, 20, 25, 23, 24, 46, 47, 18, 47, 15, 17, 47, 17, 18, 15, 16, 17],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-14440, -9648),
                                FixVec(-30273, -12539),
                                FixVec(-47243, -9397),
                                FixVec(-32768, 0),
                                FixVec(-23621, -4698)]
                            , side: [.outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-16384, 0),
                                FixVec(-23621, -4698),
                                FixVec(-32768, 0),
                                FixVec(-17033, 3388)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-17033, 3388),
                                FixVec(-30273, 12539),
                                FixVec(-40051, 26761),
                                FixVec(-23170, 23170),
                                FixVec(-20025, 13380)]
                            , side: [.outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-17033, 3388),
                                FixVec(-20025, 13380),
                                FixVec(-15136, 6269)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-16384, 0),
                                FixVec(-17033, 3388),
                                FixVec(-15136, 6269),
                                FixVec(-8516, 1694)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-26761, -40051),
                                FixVec(-23170, -23170),
                                FixVec(-14440, -9648),
                                FixVec(-13380, -20025),
                                FixVec(-12539, -30273)]
                            , side: [.outer, .outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-12539, -30273),
                                FixVec(-13380, -20025),
                                FixVec(-6269, -15136),
                                FixVec(-3388, -17033)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -16384),
                                FixVec(-3388, -17033),
                                FixVec(-6269, -15136),
                                FixVec(-1694, -8516)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -32768),
                                FixVec(-3388, -17033),
                                FixVec(0, -16384),
                                FixVec(4698, -23621)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(9648, -14440),
                                FixVec(12539, -30273),
                                FixVec(9397, -47243),
                                FixVec(0, -32768),
                                FixVec(4698, -23621)]
                            , side: [.outer, .outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(9648, -14440),
                                FixVec(4698, -23621),
                                FixVec(6269, -15136)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-14440, -9648),
                                FixVec(-23621, -4698),
                                FixVec(-15136, -6269)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-11585, -11585),
                                FixVec(-13380, -20025),
                                FixVec(-14440, -9648)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-11585, -11585),
                                FixVec(-14440, -9648),
                                FixVec(-15136, -6269),
                                FixVec(-7220, -4824)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-11585, 11585),
                                FixVec(-20025, 13380),
                                FixVec(-23170, 23170),
                                FixVec(-9648, 14440)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-6269, 15136),
                                FixVec(-9648, 14440),
                                FixVec(-12539, 30273),
                                FixVec(-4698, 23621)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-11585, 11585),
                                FixVec(-9648, 14440),
                                FixVec(-6269, 15136),
                                FixVec(-4824, 7220)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(3388, 17033),
                                FixVec(-4698, 23621),
                                FixVec(-12539, 30273),
                                FixVec(-9397, 47243),
                                FixVec(0, 32768)]
                            , side: [.inner, .inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-4698, 23621),
                                FixVec(3388, 17033),
                                FixVec(0, 16384)]
                            , side: [.inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(6269, 15136),
                                FixVec(1694, 8516),
                                FixVec(0, 16384),
                                FixVec(3388, 17033)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(6269, 15136),
                                FixVec(3388, 17033),
                                FixVec(12539, 30273),
                                FixVec(13380, 20025)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(26761, 40050),
                                FixVec(23170, 23170),
                                FixVec(14440, 9648),
                                FixVec(13380, 20025),
                                FixVec(12539, 30273)]
                            , side: [.outer, .outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(11585, -11585),
                                FixVec(9648, -14440),
                                FixVec(6269, -15136),
                                FixVec(4824, -7220)]
                            , side: [.inner, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(23170, -23170),
                                FixVec(9648, -14440),
                                FixVec(11585, -11585),
                                FixVec(20025, -13380)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(11585, 11585),
                                FixVec(13380, 20025),
                                FixVec(14440, 9648)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(15136, 6269),
                                FixVec(7220, 4824),
                                FixVec(11585, 11585),
                                FixVec(14440, 9648)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(30273, 12539),
                                FixVec(23621, 4698),
                                FixVec(15136, 6269),
                                FixVec(14440, 9648)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15136, -6269),
                                FixVec(8516, -1694),
                                FixVec(16384, 0),
                                FixVec(17033, -3388)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(30273, -12539),
                                FixVec(20025, -13380),
                                FixVec(15136, -6269),
                                FixVec(17033, -3388)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(40051, -26761),
                                FixVec(23170, -23170),
                                FixVec(20025, -13380),
                                FixVec(30273, -12539)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(32768, 0),
                                FixVec(17033, -3388),
                                FixVec(16384, 0),
                                FixVec(23621, 4698)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(47243, 9397),
                                FixVec(32768, 0),
                                FixVec(23621, 4698),
                                FixVec(30273, 12539)]
                            , side: [.outer, .inner, .inner, .outer])]),
        // 69
        TriangulationTest(
                shape: FixShape(paths: [
                    [
                        FixVec(0, -18432),
                        FixVec(-2867, -20070),
                        FixVec(-4915, -20070),
                        FixVec(-3686, -18022),
                        FixVec(-6553, -18432),
                        FixVec(-9420, -17203),
                        FixVec(-7782, -15564),
                        FixVec(-10649, -15974),
                        FixVec(-13107, -13926),
                        FixVec(-10649, -13107),
                        FixVec(-13926, -12697),
                        FixVec(-15564, -11059),
                        FixVec(-14336, -10240),
                        FixVec(-16384, -9830),
                        FixVec(-17612, -7372),
                        FixVec(-13107, -6963),
                        FixVec(-7372, -4096),
                        FixVec(-7782, -1228),
                        FixVec(-8601, 819),
                        FixVec(-9011, -409),
                        FixVec(-10240, -1228),
                        FixVec(-10649, 1228),
                        FixVec(-11059, 0),
                        FixVec(-13107, -1638),
                        FixVec(-13107, 1228),
                        FixVec(-13926, -409),
                        FixVec(-16793, -2048),
                        FixVec(-16384, 409),
                        FixVec(-18841, -1228),
                        FixVec(-18841, 1228),
                        FixVec(-21708, -409),
                        FixVec(-21299, 1638),
                        FixVec(-24166, 409),
                        FixVec(-23756, 2867),
                        FixVec(-26624, 1638),
                        FixVec(-25804, 3686),
                        FixVec(-29900, 2457),
                        FixVec(-29081, 4505),
                        FixVec(-33177, 3686),
                        FixVec(-31744, 6553),
                        FixVec(-36044, 6144),
                        FixVec(-34816, 7372),
                        FixVec(-38502, 7782),
                        FixVec(-36454, 9420),
                        FixVec(-39321, 9011),
                        FixVec(-42188, 9420),
                        FixVec(-40140, 11059),
                        FixVec(-43008, 11059),
                        FixVec(-45875, 12288),
                        FixVec(-42188, 13926),
                        FixVec(-46284, 13926),
                        FixVec(-48742, 15564),
                        FixVec(-43827, 16793),
                        FixVec(-47923, 17612),
                        FixVec(-49971, 20070),
                        FixVec(-45056, 20070),
                        FixVec(-41779, 20480),
                        FixVec(-43827, 20889),
                        FixVec(-47104, 23961),
                        FixVec(-49152, 26214),
                        FixVec(-43008, 23756),
                        FixVec(-37683, 22528),
                        FixVec(-39321, 24166),
                        FixVec(-40550, 27033),
                        FixVec(-40550, 31129),
                        FixVec(-38502, 27033),
                        FixVec(-28672, 22937),
                        FixVec(-30720, 24985),
                        FixVec(-30720, 27443),
                        FixVec(-29081, 25395),
                        FixVec(-21708, 22528),
                        FixVec(-11264, 13926),
                        FixVec(-8601, 12697),
                        FixVec(-6144, 12697),
                        FixVec(-4096, 13107),
                        FixVec(-2457, 14336),
                        FixVec(0, 14745),
                        FixVec(2457, 14336),
                        FixVec(4096, 13107),
                        FixVec(6144, 12697),
                        FixVec(8601, 12697),
                        FixVec(11264, 13926),
                        FixVec(21708, 22528),
                        FixVec(29081, 25395),
                        FixVec(30720, 27443),
                        FixVec(30720, 24985),
                        FixVec(28672, 22937),
                        FixVec(38502, 27033),
                        FixVec(40550, 31129),
                        FixVec(40550, 27033),
                        FixVec(39321, 24166),
                        FixVec(37683, 22528),
                        FixVec(43008, 23756),
                        FixVec(49152, 26214),
                        FixVec(47104, 23961),
                        FixVec(43827, 20889),
                        FixVec(41779, 20480),
                        FixVec(45056, 20070),
                        FixVec(49971, 20070),
                        FixVec(47923, 17612),
                        FixVec(43827, 16793),
                        FixVec(48742, 15564),
                        FixVec(46284, 13926),
                        FixVec(42188, 13926),
                        FixVec(45875, 12288),
                        FixVec(43008, 11059),
                        FixVec(40140, 11059),
                        FixVec(42188, 9420),
                        FixVec(39321, 9011),
                        FixVec(36454, 9420),
                        FixVec(38502, 7782),
                        FixVec(34816, 7372),
                        FixVec(36044, 6144),
                        FixVec(31744, 6553),
                        FixVec(33177, 3686),
                        FixVec(29081, 4505),
                        FixVec(29900, 2457),
                        FixVec(25804, 3686),
                        FixVec(26624, 1638),
                        FixVec(23756, 2867),
                        FixVec(24166, 409),
                        FixVec(21299, 1638),
                        FixVec(21708, -409),
                        FixVec(18841, 1228),
                        FixVec(18841, -1228),
                        FixVec(16384, 409),
                        FixVec(16793, -2048),
                        FixVec(13926, -409),
                        FixVec(13107, 1228),
                        FixVec(13107, -1638),
                        FixVec(11059, 0),
                        FixVec(10649, 1228),
                        FixVec(10240, -1228),
                        FixVec(9011, -409),
                        FixVec(8601, 819),
                        FixVec(7782, -1228),
                        FixVec(7372, -4096),
                        FixVec(13107, -6963),
                        FixVec(17612, -7372),
                        FixVec(16384, -9830),
                        FixVec(14336, -10240),
                        FixVec(15564, -11059),
                        FixVec(13926, -12697),
                        FixVec(10649, -13107),
                        FixVec(13107, -13926),
                        FixVec(10649, -15974),
                        FixVec(7782, -15564),
                        FixVec(9420, -17203),
                        FixVec(6553, -18432),
                        FixVec(3686, -18022),
                        FixVec(4915, -20070),
                        FixVec(2867, -20070)],
                    [
                        FixVec(-2457, 9420),
                        FixVec(-2457, 8192),
                        FixVec(-1638, 7372),
                        FixVec(-1228, 8192)],
                    [
                        FixVec(1228, 8192),
                        FixVec(1638, 7372),
                        FixVec(2457, 8192),
                        FixVec(2457, 9420)],
                    [
                        FixVec(0, 8192),
                        FixVec(-819, 7782),
                        FixVec(-1228, 6963),
                        FixVec(-1638, 6553),
                        FixVec(-3276, 6553),
                        FixVec(-1638, 5734),
                        FixVec(-819, 4915),
                        FixVec(0, 2867),
                        FixVec(819, 4915),
                        FixVec(1638, 5734),
                        FixVec(3276, 6553),
                        FixVec(1638, 6553),
                        FixVec(1228, 6963),
                        FixVec(819, 7782)]]
                ),
                points: [
                    FixVec(-45056, 20070),
                    FixVec(-41779, 20480),
                    FixVec(-43827, 20889),
                    FixVec(-47104, 23961),
                    FixVec(-49152, 26214),
                    FixVec(-43008, 23756),
                    FixVec(-37683, 22528),
                    FixVec(-39321, 24166),
                    FixVec(-40550, 27033),
                    FixVec(-40550, 31129),
                    FixVec(-38502, 27033),
                    FixVec(-28672, 22937),
                    FixVec(-30720, 24985),
                    FixVec(-30720, 27443),
                    FixVec(-29081, 25395),
                    FixVec(-21708, 22528),
                    FixVec(-11264, 13926),
                    FixVec(-8601, 12697),
                    FixVec(-6144, 12697),
                    FixVec(-4096, 13107),
                    FixVec(-2457, 14336),
                    FixVec(0, 14745),
                    FixVec(2457, 14336),
                    FixVec(4096, 13107),
                    FixVec(6144, 12697),
                    FixVec(8601, 12697),
                    FixVec(11264, 13926),
                    FixVec(21708, 22528),
                    FixVec(29081, 25395),
                    FixVec(30720, 27443),
                    FixVec(30720, 24985),
                    FixVec(28672, 22937),
                    FixVec(38502, 27033),
                    FixVec(40550, 31129),
                    FixVec(40550, 27033),
                    FixVec(39321, 24166),
                    FixVec(37683, 22528),
                    FixVec(43008, 23756),
                    FixVec(49152, 26214),
                    FixVec(47104, 23961),
                    FixVec(43827, 20889),
                    FixVec(41779, 20480),
                    FixVec(45056, 20070),
                    FixVec(49971, 20070),
                    FixVec(47923, 17612),
                    FixVec(43827, 16793),
                    FixVec(48742, 15564),
                    FixVec(46284, 13926),
                    FixVec(42188, 13926),
                    FixVec(45875, 12288),
                    FixVec(43008, 11059),
                    FixVec(40140, 11059),
                    FixVec(42188, 9420),
                    FixVec(39321, 9011),
                    FixVec(36454, 9420),
                    FixVec(38502, 7782),
                    FixVec(34816, 7372),
                    FixVec(36044, 6144),
                    FixVec(31744, 6553),
                    FixVec(33177, 3686),
                    FixVec(29081, 4505),
                    FixVec(29900, 2457),
                    FixVec(25804, 3686),
                    FixVec(26624, 1638),
                    FixVec(23756, 2867),
                    FixVec(24166, 409),
                    FixVec(21299, 1638),
                    FixVec(21708, -409),
                    FixVec(18841, 1228),
                    FixVec(18841, -1228),
                    FixVec(16384, 409),
                    FixVec(16793, -2048),
                    FixVec(13926, -409),
                    FixVec(13107, 1228),
                    FixVec(13107, -1638),
                    FixVec(11059, 0),
                    FixVec(10649, 1228),
                    FixVec(10240, -1228),
                    FixVec(9011, -409),
                    FixVec(8601, 819),
                    FixVec(7782, -1228),
                    FixVec(7372, -4096),
                    FixVec(13107, -6963),
                    FixVec(17612, -7372),
                    FixVec(16384, -9830),
                    FixVec(14336, -10240),
                    FixVec(15564, -11059),
                    FixVec(13926, -12697),
                    FixVec(10649, -13107),
                    FixVec(13107, -13926),
                    FixVec(10649, -15974),
                    FixVec(7782, -15564),
                    FixVec(9420, -17203),
                    FixVec(6553, -18432),
                    FixVec(3686, -18022),
                    FixVec(4915, -20070),
                    FixVec(2867, -20070),
                    FixVec(0, -18432),
                    FixVec(-2867, -20070),
                    FixVec(-4915, -20070),
                    FixVec(-3686, -18022),
                    FixVec(-6553, -18432),
                    FixVec(-9420, -17203),
                    FixVec(-7782, -15564),
                    FixVec(-10649, -15974),
                    FixVec(-13107, -13926),
                    FixVec(-10649, -13107),
                    FixVec(-13926, -12697),
                    FixVec(-15564, -11059),
                    FixVec(-14336, -10240),
                    FixVec(-16384, -9830),
                    FixVec(-17612, -7372),
                    FixVec(-13107, -6963),
                    FixVec(-7372, -4096),
                    FixVec(-7782, -1228),
                    FixVec(-8601, 819),
                    FixVec(-9011, -409),
                    FixVec(-10240, -1228),
                    FixVec(-10649, 1228),
                    FixVec(-11059, 0),
                    FixVec(-13107, -1638),
                    FixVec(-13107, 1228),
                    FixVec(-13926, -409),
                    FixVec(-16793, -2048),
                    FixVec(-16384, 409),
                    FixVec(-18841, -1228),
                    FixVec(-18841, 1228),
                    FixVec(-21708, -409),
                    FixVec(-21299, 1638),
                    FixVec(-24166, 409),
                    FixVec(-23756, 2867),
                    FixVec(-26624, 1638),
                    FixVec(-25804, 3686),
                    FixVec(-29900, 2457),
                    FixVec(-29081, 4505),
                    FixVec(-33177, 3686),
                    FixVec(-31744, 6553),
                    FixVec(-36044, 6144),
                    FixVec(-34816, 7372),
                    FixVec(-38502, 7782),
                    FixVec(-36454, 9420),
                    FixVec(-39321, 9011),
                    FixVec(-42188, 9420),
                    FixVec(-40140, 11059),
                    FixVec(-43008, 11059),
                    FixVec(-45875, 12288),
                    FixVec(-42188, 13926),
                    FixVec(-46284, 13926),
                    FixVec(-48742, 15564),
                    FixVec(-43827, 16793),
                    FixVec(-47923, 17612),
                    FixVec(-49971, 20070),
                    FixVec(-3276, 6553),
                    FixVec(-1638, 5734),
                    FixVec(-819, 4915),
                    FixVec(0, 2867),
                    FixVec(819, 4915),
                    FixVec(1638, 5734),
                    FixVec(3276, 6553),
                    FixVec(1638, 6553),
                    FixVec(1228, 6963),
                    FixVec(819, 7782),
                    FixVec(0, 8192),
                    FixVec(-819, 7782),
                    FixVec(-1228, 6963),
                    FixVec(-1638, 6553),
                    FixVec(-1638, 7372),
                    FixVec(-1228, 8192),
                    FixVec(-2457, 9420),
                    FixVec(-2457, 8192),
                    FixVec(1228, 8192),
                    FixVec(1638, 7372),
                    FixVec(2457, 8192),
                    FixVec(2457, 9420)],
                indices: [151, 0, 150, 150, 0, 149, 149, 0, 1, 149, 1, 146, 3, 4, 5, 3, 5, 2, 2, 5, 1, 6, 143, 146, 5, 6, 1, 140, 143, 6, 140, 141, 143, 148, 149, 147, 147, 149, 146, 145, 146, 144, 144, 146, 143, 6, 146, 1, 142, 143, 141, 8, 9, 10, 8, 10, 7, 7, 10, 6, 11, 140, 6, 11, 6, 10, 140, 136, 138, 11, 136, 140, 15, 136, 11, 139, 140, 138, 137, 138, 136, 135, 136, 134, 13, 14, 12, 12, 14, 11, 15, 132, 136, 11, 14, 15, 16, 132, 15, 133, 134, 132, 132, 134, 136, 131, 132, 130, 129, 130, 128, 16, 130, 132, 128, 130, 16, 128, 16, 126, 121, 124, 126, 124, 121, 122, 16, 121, 126, 127, 128, 126, 125, 126, 124, 110, 111, 112, 110, 112, 109, 109, 112, 106, 109, 106, 107, 106, 112, 113, 106, 113, 103, 123, 124, 122, 108, 109, 107, 105, 106, 104, 104, 106, 103, 121, 16, 17, 121, 119, 120, 118, 119, 121, 121, 17, 118, 118, 116, 117, 115, 116, 118, 152, 118, 17, 152, 17, 18, 168, 18, 19, 152, 115, 118, 153, 115, 152, 155, 153, 154, 155, 115, 153, 115, 155, 114, 168, 152, 18, 152, 168, 169, 19, 20, 168, 21, 168, 20, 162, 167, 168, 167, 162, 163, 168, 21, 173, 168, 173, 162, 162, 170, 161, 171, 161, 170, 173, 170, 162, 21, 22, 173, 102, 103, 101, 103, 113, 100, 99, 100, 98, 103, 100, 101, 155, 113, 114, 113, 97, 100, 100, 97, 98, 113, 155, 81, 155, 156, 157, 155, 157, 79, 81, 97, 113, 157, 158, 79, 97, 94, 96, 96, 94, 95, 152, 169, 166, 152, 166, 165, 165, 166, 164, 163, 166, 167, 163, 164, 166, 171, 160, 161, 171, 159, 160, 158, 171, 172, 173, 22, 23, 158, 159, 171, 173, 23, 24, 158, 173, 24, 158, 172, 173, 158, 24, 25, 81, 94, 97, 91, 94, 81, 155, 80, 81, 155, 79, 80, 158, 25, 76, 158, 76, 79, 78, 79, 76, 78, 76, 77, 73, 25, 26, 73, 76, 25, 73, 75, 76, 75, 73, 74, 68, 73, 26, 73, 70, 72, 68, 70, 73, 70, 68, 69, 68, 26, 66, 62, 26, 27, 26, 64, 66, 66, 64, 65, 91, 93, 94, 93, 91, 92, 91, 81, 88, 91, 88, 90, 81, 82, 88, 88, 82, 85, 88, 85, 87, 85, 82, 84, 82, 83, 84, 90, 88, 89, 87, 85, 86, 72, 70, 71, 68, 66, 67, 62, 64, 26, 58, 27, 31, 27, 28, 31, 31, 28, 30, 28, 29, 30, 64, 62, 63, 62, 27, 58, 62, 60, 61, 62, 58, 60, 58, 31, 54, 58, 54, 56, 54, 31, 36, 31, 32, 36, 36, 32, 35, 35, 32, 34, 32, 33, 34, 60, 58, 59, 58, 56, 57, 56, 54, 55, 54, 36, 51, 54, 51, 53, 36, 41, 48, 36, 37, 41, 41, 37, 40, 40, 37, 39, 37, 38, 39, 53, 51, 52, 36, 48, 51, 51, 48, 50, 48, 49, 50, 48, 41, 45, 41, 42, 45, 45, 42, 44, 42, 43, 44, 48, 45, 47, 45, 46, 47],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-43827, 16793),
                                FixVec(-47923, 17612),
                                FixVec(-49971, 20070),
                                FixVec(-45056, 20070)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-42188, 13926),
                                FixVec(-43827, 16793),
                                FixVec(-45056, 20070),
                                FixVec(-41779, 20480)]
                            , side: [.inner, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-41779, 20480),
                                FixVec(-43827, 20889),
                                FixVec(-47104, 23961),
                                FixVec(-49152, 26214),
                                FixVec(-43008, 23756)]
                            , side: [.outer, .outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-28672, 22937),
                                FixVec(-36454, 9420),
                                FixVec(-40140, 11059),
                                FixVec(-42188, 13926),
                                FixVec(-41779, 20480),
                                FixVec(-37683, 22528)]
                            , side: [.inner, .inner, .inner, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-41779, 20480),
                                FixVec(-43008, 23756),
                                FixVec(-37683, 22528)]
                            , side: [.inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-42188, 9420),
                                FixVec(-40140, 11059),
                                FixVec(-36454, 9420),
                                FixVec(-39321, 9011)]
                            , side: [.outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-42188, 13926),
                                FixVec(-46284, 13926),
                                FixVec(-48742, 15564),
                                FixVec(-43827, 16793)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-40140, 11059),
                                FixVec(-43008, 11059),
                                FixVec(-45875, 12288),
                                FixVec(-42188, 13926)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-37683, 22528),
                                FixVec(-39321, 24166),
                                FixVec(-40550, 27033),
                                FixVec(-40550, 31129),
                                FixVec(-38502, 27033)]
                            , side: [.outer, .outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-38502, 27033),
                                FixVec(-28672, 22937),
                                FixVec(-37683, 22528)]
                            , side: [.outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-21708, 22528),
                                FixVec(-31744, 6553),
                                FixVec(-34816, 7372),
                                FixVec(-36454, 9420),
                                FixVec(-28672, 22937)]
                            , side: [.inner, .inner, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-34816, 7372),
                                FixVec(-38502, 7782),
                                FixVec(-36454, 9420)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-31744, 6553),
                                FixVec(-36044, 6144),
                                FixVec(-34816, 7372)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-29081, 4505),
                                FixVec(-33177, 3686),
                                FixVec(-31744, 6553)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-28672, 22937),
                                FixVec(-30720, 24985),
                                FixVec(-30720, 27443),
                                FixVec(-29081, 25395)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-11264, 13926),
                                FixVec(-25804, 3686),
                                FixVec(-29081, 4505),
                                FixVec(-31744, 6553),
                                FixVec(-21708, 22528)]
                            , side: [.inner, .inner, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-21708, 22528),
                                FixVec(-28672, 22937),
                                FixVec(-29081, 25395)]
                            , side: [.inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-25804, 3686),
                                FixVec(-29900, 2457),
                                FixVec(-29081, 4505)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-11264, 13926),
                                FixVec(-23756, 2867),
                                FixVec(-26624, 1638),
                                FixVec(-25804, 3686)]
                            , side: [.inner, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-11264, 13926),
                                FixVec(-21299, 1638),
                                FixVec(-24166, 409),
                                FixVec(-23756, 2867)]
                            , side: [.inner, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-21708, -409),
                                FixVec(-21299, 1638),
                                FixVec(-11264, 13926),
                                FixVec(-18841, 1228)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-13926, -409),
                                FixVec(-16384, 409),
                                FixVec(-18841, 1228),
                                FixVec(-11264, 13926),
                                FixVec(-8601, 12697),
                                FixVec(-13107, 1228)]
                            , side: [.inner, .inner, .inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-16384, 409),
                                FixVec(-18841, -1228),
                                FixVec(-18841, 1228)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-14336, -10240),
                                FixVec(-16384, -9830),
                                FixVec(-17612, -7372),
                                FixVec(-13107, -6963)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-7372, -4096),
                                FixVec(-10649, -13107),
                                FixVec(-13926, -12697),
                                FixVec(-14336, -10240),
                                FixVec(-13107, -6963)]
                            , side: [.inner, .outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-10649, -15974),
                                FixVec(-10649, -13107),
                                FixVec(-7372, -4096),
                                FixVec(-7782, -15564)]
                            , side: [.inner, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-13926, -409),
                                FixVec(-16793, -2048),
                                FixVec(-16384, 409)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-13926, -12697),
                                FixVec(-15564, -11059),
                                FixVec(-14336, -10240)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-10649, -15974),
                                FixVec(-13107, -13926),
                                FixVec(-10649, -13107)]
                            , side: [.outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-8601, 12697),
                                FixVec(-10649, 1228),
                                FixVec(-11059, 0),
                                FixVec(-13107, -1638),
                                FixVec(-13107, 1228)]
                            , side: [.inner, .outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-8601, 819),
                                FixVec(-9011, -409),
                                FixVec(-10240, -1228),
                                FixVec(-10649, 1228)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-8601, 819),
                                FixVec(-10649, 1228),
                                FixVec(-8601, 12697),
                                FixVec(-6144, 12697),
                                FixVec(-2457, 9420),
                                FixVec(-2457, 8192),
                                FixVec(-3276, 6553)]
                            , side: [.inner, .inner, .outer, .inner, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-4096, 13107),
                                FixVec(-2457, 9420),
                                FixVec(-6144, 12697)]
                            , side: [.inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-819, 4915),
                                FixVec(0, 2867),
                                FixVec(-7782, -1228),
                                FixVec(-8601, 819),
                                FixVec(-3276, 6553),
                                FixVec(-1638, 5734)]
                            , side: [.outer, .inner, .outer, .inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(4096, 13107),
                                FixVec(2457, 9420),
                                FixVec(1228, 8192),
                                FixVec(0, 8192),
                                FixVec(-1228, 8192),
                                FixVec(-2457, 9420),
                                FixVec(-4096, 13107),
                                FixVec(-2457, 14336),
                                FixVec(0, 14745),
                                FixVec(2457, 14336)]
                            , side: [.inner, .outer, .inner, .inner, .outer, .inner, .outer, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-1638, 7372),
                                FixVec(-1228, 8192),
                                FixVec(0, 8192),
                                FixVec(-819, 7782)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(1638, 7372),
                                FixVec(819, 7782),
                                FixVec(0, 8192),
                                FixVec(1228, 8192)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-3686, -18022),
                                FixVec(-6553, -18432),
                                FixVec(-9420, -17203),
                                FixVec(-7782, -15564)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(13107, -6963),
                                FixVec(10649, -13107),
                                FixVec(7782, -15564),
                                FixVec(3686, -18022),
                                FixVec(0, -18432),
                                FixVec(-3686, -18022),
                                FixVec(-7782, -15564),
                                FixVec(-7372, -4096),
                                FixVec(7372, -4096)]
                            , side: [.inner, .inner, .inner, .inner, .inner, .inner, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(0, -18432),
                                FixVec(-2867, -20070),
                                FixVec(-4915, -20070),
                                FixVec(-3686, -18022)]
                            , side: [.outer, .outer, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(7782, -1228),
                                FixVec(7372, -4096),
                                FixVec(-7372, -4096),
                                FixVec(-7782, -1228),
                                FixVec(0, 2867)]
                            , side: [.outer, .inner, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(3276, 6553),
                                FixVec(8601, 819),
                                FixVec(7782, -1228),
                                FixVec(0, 2867),
                                FixVec(819, 4915),
                                FixVec(1638, 5734)]
                            , side: [.inner, .outer, .inner, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(4915, -20070),
                                FixVec(2867, -20070),
                                FixVec(0, -18432),
                                FixVec(3686, -18022)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(-1638, 6553),
                                FixVec(-3276, 6553),
                                FixVec(-2457, 8192),
                                FixVec(-1638, 7372)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(-819, 7782),
                                FixVec(-1228, 6963),
                                FixVec(-1638, 6553),
                                FixVec(-1638, 7372)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(1638, 6553),
                                FixVec(1228, 6963),
                                FixVec(819, 7782),
                                FixVec(1638, 7372)]
                            , side: [.outer, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(1638, 6553),
                                FixVec(1638, 7372),
                                FixVec(2457, 8192),
                                FixVec(3276, 6553)]
                            , side: [.inner, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(2457, 8192),
                                FixVec(2457, 9420),
                                FixVec(4096, 13107),
                                FixVec(6144, 12697),
                                FixVec(3276, 6553)]
                            , side: [.outer, .inner, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(8601, 819),
                                FixVec(3276, 6553),
                                FixVec(6144, 12697),
                                FixVec(8601, 12697),
                                FixVec(10649, 1228)]
                            , side: [.inner, .inner, .outer, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(10240, -1228),
                                FixVec(9011, -409),
                                FixVec(8601, 819),
                                FixVec(10649, 1228)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(13926, -409),
                                FixVec(13107, 1228),
                                FixVec(8601, 12697),
                                FixVec(11264, 13926),
                                FixVec(18841, 1228),
                                FixVec(16384, 409)]
                            , side: [.outer, .inner, .outer, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(13107, -1638),
                                FixVec(11059, 0),
                                FixVec(10649, 1228),
                                FixVec(8601, 12697),
                                FixVec(13107, 1228)]
                            , side: [.outer, .outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(18841, -1228),
                                FixVec(16384, 409),
                                FixVec(18841, 1228)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(21708, -409),
                                FixVec(18841, 1228),
                                FixVec(11264, 13926),
                                FixVec(21299, 1638)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(28672, 22937),
                                FixVec(31744, 6553),
                                FixVec(29081, 4505),
                                FixVec(25804, 3686),
                                FixVec(11264, 13926),
                                FixVec(21708, 22528)]
                            , side: [.inner, .inner, .inner, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(24166, 409),
                                FixVec(21299, 1638),
                                FixVec(11264, 13926),
                                FixVec(23756, 2867)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(9420, -17203),
                                FixVec(6553, -18432),
                                FixVec(3686, -18022),
                                FixVec(7782, -15564)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(13107, -13926),
                                FixVec(10649, -15974),
                                FixVec(7782, -15564),
                                FixVec(10649, -13107)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(13926, -12697),
                                FixVec(10649, -13107),
                                FixVec(13107, -6963),
                                FixVec(14336, -10240)]
                            , side: [.outer, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(17612, -7372),
                                FixVec(16384, -9830),
                                FixVec(14336, -10240),
                                FixVec(13107, -6963)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(15564, -11059),
                                FixVec(13926, -12697),
                                FixVec(14336, -10240)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(16793, -2048),
                                FixVec(13926, -409),
                                FixVec(16384, 409)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(26624, 1638),
                                FixVec(23756, 2867),
                                FixVec(11264, 13926),
                                FixVec(25804, 3686)]
                            , side: [.outer, .inner, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(30720, 24985),
                                FixVec(28672, 22937),
                                FixVec(21708, 22528),
                                FixVec(29081, 25395)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(30720, 24985),
                                FixVec(29081, 25395),
                                FixVec(30720, 27443)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(29900, 2457),
                                FixVec(25804, 3686),
                                FixVec(29081, 4505)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(37683, 22528),
                                FixVec(36454, 9420),
                                FixVec(34816, 7372),
                                FixVec(31744, 6553),
                                FixVec(28672, 22937)]
                            , side: [.inner, .inner, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(40550, 27033),
                                FixVec(39321, 24166),
                                FixVec(37683, 22528),
                                FixVec(28672, 22937),
                                FixVec(38502, 27033)]
                            , side: [.outer, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(40550, 27033),
                                FixVec(38502, 27033),
                                FixVec(40550, 31129)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(33177, 3686),
                                FixVec(29081, 4505),
                                FixVec(31744, 6553)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(36044, 6144),
                                FixVec(31744, 6553),
                                FixVec(34816, 7372)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(38502, 7782),
                                FixVec(34816, 7372),
                                FixVec(36454, 9420)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(39321, 9011),
                                FixVec(36454, 9420),
                                FixVec(37683, 22528),
                                FixVec(40140, 11059)]
                            , side: [.outer, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(43827, 16793),
                                FixVec(42188, 13926),
                                FixVec(40140, 11059),
                                FixVec(37683, 22528),
                                FixVec(41779, 20480)]
                            , side: [.inner, .inner, .inner, .inner, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(47104, 23961),
                                FixVec(43827, 20889),
                                FixVec(41779, 20480),
                                FixVec(37683, 22528),
                                FixVec(43008, 23756)]
                            , side: [.outer, .outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(47104, 23961),
                                FixVec(43008, 23756),
                                FixVec(49152, 26214)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(42188, 9420),
                                FixVec(39321, 9011),
                                FixVec(40140, 11059)]
                            , side: [.outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(45875, 12288),
                                FixVec(43008, 11059),
                                FixVec(40140, 11059),
                                FixVec(42188, 13926)]
                            , side: [.outer, .outer, .inner, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(47923, 17612),
                                FixVec(43827, 16793),
                                FixVec(41779, 20480),
                                FixVec(45056, 20070)]
                            , side: [.outer, .inner, .outer, .inner]),
                    ConvexPath(
                            path: [
                                FixVec(47923, 17612),
                                FixVec(45056, 20070),
                                FixVec(49971, 20070)]
                            , side: [.inner, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(48742, 15564),
                                FixVec(46284, 13926),
                                FixVec(42188, 13926),
                                FixVec(43827, 16793)]
                            , side: [.outer, .outer, .inner, .outer])]),

        // 70
        TriangulationTest(
                shape: FixShape(contour: [
                    FixVec(0, 0),
                    FixVec(-5120, 5120),
                    FixVec(-5120, 10240),
                    FixVec(5120, 10240),
                    FixVec(5120, 5120),
                    FixVec(0, 0),
                    FixVec(5120, -5120),
                    FixVec(5120, -10240),
                    FixVec(-5120, -10240),
                    FixVec(-5120, -5120)]
                ),
                points: [
                    FixVec(-5120, -10240),
                    FixVec(-5120, -5120),
                    FixVec(0, 0),
                    FixVec(5120, -5120),
                    FixVec(5120, -10240),
                    FixVec(-5120, 5120),
                    FixVec(-5120, 10240),
                    FixVec(5120, 10240),
                    FixVec(5120, 5120),
                    FixVec(0, 0)],
                indices: [3, 1, 2, 1, 4, 0, 3, 4, 1, 5, 6, 8, 5, 8, 9, 6, 7, 8],
                polygons: [
                    ConvexPath(
                            path: [
                                FixVec(-5120, -10240),
                                FixVec(-5120, -5120),
                                FixVec(0, 0),
                                FixVec(5120, -5120),
                                FixVec(5120, -10240)]
                            , side: [.outer, .outer, .outer, .outer, .outer]),
                    ConvexPath(
                            path: [
                                FixVec(5120, 10240),
                                FixVec(5120, 5120),
                                FixVec(0, 0),
                                FixVec(-5120, 5120),
                                FixVec(-5120, 10240)],
                            side: [.outer, .outer, .outer, .outer, .outer])
                ])

    ]
}

private extension FixVec {
    static func float(_ x: Double, _ y: Double) -> FixVec {
        FixVec(x: x.fix, y: y.fix)
    }
}
