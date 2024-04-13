import iShape
import iFixFloat
import Foundation
import simd
@testable import iTriangle

struct TriangulationTest: Decodable {
    let shape: Shape
    let points: Path
    let indices: [Int]
    let polygons: [Path]

    enum CodingKeys: String, CodingKey {
        case shape
        case points
        case indices
        case polygons
    }
}


struct TriangulationTestBank {
    
    static func load(index: Int) -> TriangulationTest {
        let bundle = Bundle.module
        
        if let fileURL = bundle.url(forResource: "triangle_test_\(index)", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)

                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(TriangulationTest.self, from: data)
                
                return decodedData
            } catch {
                print("Error loading resource: \(error)")
            }
        }
        
        fatalError("Error loading test file: \(index)")
    }
}
