import XCTest
import iShape
import iFixFloat
@testable import iTriangle

final class iTriangleTests: XCTestCase {

    private func execute(index: Int) {
        let test = TriangulationTestBank.data[index]
        
        let triangulation = test.shape.triangulate()
        
        XCTAssertTrue(!triangulation.indices.isEmpty)
        
        XCTAssertEqual(test.indices, triangulation.indices)
        XCTAssertEqual(test.points, triangulation.points)
    }
    
    
    func test_0() throws {
        self.execute(index: 0)
    }
    
    func test_1() throws {
        self.execute(index: 1)
    }
    
    func test_2() throws {
        self.execute(index: 2)
    }
    
    func test_3() throws {
        self.execute(index: 3)
    }
    
    func test_4() throws {
        self.execute(index: 4)
    }
    
    func test_5() throws {
        self.execute(index: 5)
    }
    
    func test_6() throws {
        self.execute(index: 6)
    }
    
    func test_7() throws {
        self.execute(index: 7)
    }
    
    /*
    
    func test_4() throws {
        let shape = FixShape(paths: [
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
        ])
        
        let result = shape.delaunay()
        
        XCTAssertNotNil(result)
        
        let delaunay = result!
        
        let indices = delaunay.trianglesIndices
        let points = delaunay.points
        
        
        let indices_must_be = [0, 1, 3, 1, 2, 3, 7, 4, 6, 4, 5, 6]
        let points_must_be = [
            FixVec(-20, -20),
            FixVec(-20, 20),
            FixVec(20, 20),
            FixVec(20, -20),
            FixVec(-10, 10),
            FixVec(10, 10),
            FixVec(10, -10),
            FixVec(-10, -10)
        ]
        
        XCTAssertEqual(indices_must_be, indices)
        XCTAssertEqual(points_must_be, points)
    }
    
    func test_5() throws {
        let shape = FixShape(paths: [
            [
                FixVec(-15,   0),
                FixVec(  0,  15),
                FixVec( 15,   0),
                FixVec(  0, -15)
            ],
            [
                FixVec(-5,  0),
                FixVec( 0, -5),
                FixVec( 5,  0),
                FixVec( 0,  5)
            ]
        ])
        
        let result = shape.delaunay()
        
        XCTAssertNotNil(result)
        
        let delaunay = result!
        
        let indices = delaunay.trianglesIndices
        let points = delaunay.points
        
        
        let indices_must_be = [0, 1, 3, 3, 1, 2, 7, 4, 6, 6, 4, 5]
        let points_must_be = [
            FixVec(-15, 0),
            FixVec(0, 15),
            FixVec(15, 0),
            FixVec(0, -15),
            FixVec(0, 5),
            FixVec(5, 0),
            FixVec(0, -5),
            FixVec(-5, 0)
        ]
        
        XCTAssertEqual(indices_must_be, indices)
        XCTAssertEqual(points_must_be, points)
    }
    
    func test_6() throws {
        let shape = FixShape(contour: [
            FixVec(-10, -10),
            FixVec(  0,   0),
            FixVec(-10,  10),
            FixVec( 10,   0)
        ])
        
        let result = shape.delaunay()
        
        XCTAssertNotNil(result)
        
        let delaunay = result!
        
        let indices = delaunay.trianglesIndices
        let points = delaunay.points
        
        
        let indices_must_be = [0, 1, 3, 2, 3, 1]
        let points_must_be = [
            FixVec(-10, -10),
            FixVec(0, 0),
            FixVec(-10, 10),
            FixVec(10, 0),
            FixVec(0, 0),
            FixVec(10, 0)
        ]
        
        XCTAssertEqual(indices_must_be, indices)
        XCTAssertEqual(points_must_be, points)
    }
    
    func test_7() throws {
        let shape = FixShape(contour: [
            FixVec(-10,   0),
            FixVec( 10,  10),
            FixVec(  0,   0),
            FixVec( 10, -10)
        ])
        
        let result = shape.delaunay()
        
        XCTAssertNotNil(result)
        
        let delaunay = result!
        
        let indices = delaunay.trianglesIndices
        let points = delaunay.points
        
        
        let indices_must_be = [0, 1, 2, 0, 2, 3]
        let points_must_be = [
            FixVec(-10, 0),
            FixVec(10, 10),
            FixVec(0, 0),
            FixVec(10, -10),
            FixVec(-10, 0),
            FixVec(0, 0)
        ]
        
        XCTAssertEqual(indices_must_be, indices)
        XCTAssertEqual(points_must_be, points)
    }
*/
}
