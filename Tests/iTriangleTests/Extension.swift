//
//  Extension.swift
//  
//
//  Created by Nail Sharipov on 26.10.2023.
//

import iShape
import iFixFloat
@testable import iTriangle

extension TriangulationTestBank {
    
    static func printSwift() {
        print("static let data: [TriangulationTest] = [")
        for i in 0..<Self.data.count {
            print("\t// \(i)")
            Self.data[i].printSwift()
        }
        print("\t]")
    }
    
    static func printRust() {
        print("match index {")
        for i in 0..<Self.data.count {
            print("\(i) => {")
            Self.data[i].printRust()
            print("}")
        }
        print("_ => {")
        print("panic!(\"test not exist\")")
        print("}")
    }
}

private extension TriangulationTest {
    
    func printSwift() {
        let polies = shape.decomposeToConvexPolygons()
        
        print("TriangulationTest(")
        print("shape: \(shape.swiftString()),")
        print("points: \(points.swiftString()),")
        print("indices: \(indices.swiftString()),")
        print("polygons: \(polies.swiftString())")
        print(")")
    }
    
    func printRust() {
        print("Test {")
        print("shape: \(shape.rustString()),")
        print("points: \(points.rustString()),")
        print("indices: vec!\(indices),")
        print("}")
    }
    
}

private extension FixShape {
    func swiftString() -> String {
        if self.paths.count == 1 {
            return "FixShape(contour: \(self.contour.swiftString())\n)"
        } else {
            return "FixShape(path: \(self.paths.swiftString())\n)"
        }
    }
    func rustString() -> String {
        if self.paths.count == 1 {
            return "FixShape::new_with_contour(\(self.contour.rustString()))"
        } else {
            return "FixShape::new(\(self.paths.rustString()))"
        }
    }
}
                  
private extension Array where Element == Int {
    func swiftString() -> String {
        "\(self)"
    }
}

private extension Array where Element == FixPath {
    func swiftString() -> String {
        let last = self.count - 1
        var str = "[\n"
        for i in 0..<last {
            str += self[i].swiftString() + ",\n"
        }
        str += self[last].swiftString()
        str += "]"
        return str
    }
                
    func rustString() -> String {
        let last = self.count - 1
        var str = "vec![\n"
        for i in 0..<last {
            str += self[i].rustString() + ",\n"
        }
        str += self[last].rustString()
        str += "]"
        return str
    }
}

private extension Array where Element == FixVec {
    
    func swiftString() -> String {
        let last = self.count - 1
        var str = "[\n"
        for i in 0..<last {
            str += self[i].swiftString() + ",\n"
        }
        str += self[last].swiftString()
        str += "]"
        return str
    }
        
    func rustString() -> String {
        let last = self.count - 1
        var str = "vec![\n"
        for i in 0..<last {
            str += self[i].rustString() + ",\n"
        }
        str += self[last].rustString()
        str += "]"
        return str
    }
}

private extension FixVec {
    func swiftString() -> String {
        "FixVec(\(self.x), \(self.y))"
    }
                
                
    func rustString() -> String {
        "FixVec::new_i64(\(self.x), \(self.y))"
    }
}

private extension Array where Element == ConvexPath {

    func swiftString() -> String {
        guard !self.isEmpty else { return "" }
        let last = self.count - 1
        var str = "[\n"
        for i in 0..<last {
            str += self[i].swiftString() + ",\n"
        }
        str += self[last].swiftString()
        str += "]"
        return str
    }
              
    func rustString() -> String {
        "FixVec::new_i64"
    }
}

private extension ConvexPath {

    func swiftString() -> String {
        "ConvexPath(\npath: \(self.path.swiftString())\n, side:\(self.side.swiftString()))"
    }
              
    func rustString() -> String {
        "FixVec::new_i64"
    }
}

private extension ConvexSide {

    func swiftString() -> String {
        if self == .inner {
            return ".inner"
        } else {
            return ".outer"
        }
    }
              
    func rustString() -> String {
        "FixVec::new_i64"
    }
}

private extension Array where Element == ConvexSide {

    func swiftString() -> String {
        guard !self.isEmpty else { return "" }
        let last = self.count - 1
        var str = "["
        for i in 0..<last {
            str += self[i].swiftString() + ", "
        }
        str += self[last].swiftString()
        str += "]"
        return str
    }
              
    func rustString() -> String {
        "FixVec::new_i64"
    }
}
