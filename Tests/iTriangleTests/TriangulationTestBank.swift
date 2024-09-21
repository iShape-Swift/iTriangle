import iShape
import iFixFloat
import Foundation
import simd
@testable import iTriangle

struct TriangulationTest: Codable {
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

extension TriangulationTest {
    func printTest() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(self)
            if let json = String(data: data, encoding: .utf8) {
                print(json)
            }
        } catch {
            print("Error converting to JSON: \(error)")
        }
    }
}
