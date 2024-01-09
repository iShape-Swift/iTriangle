import iShape
import iFixFloat
import Foundation
import simd
@testable import iTriangle

struct TriangulationTest: Decodable {
    let shape: FixShape
    let points: FixPath
    let indices: [Int]
    let polygons: [FixPath]

    enum CodingKeys: String, CodingKey {
        case shape
        case points
        case indices
        case polygons
    }
}

extension FixShape: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let paths = try container.decode([FixPath].self, forKey: .paths)
        self.init(paths: paths)
    }
    
    enum CodingKeys: String, CodingKey {
        case paths
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
