//
//  DVertex.swift
//  
//
//  Created by Nail Sharipov on 08.06.2023.
//

import iFixFloat

public enum DVType {
    
    case origin
    case extraPath
    case extraInner
    case extraTessellated
    
    @inlinable
    public var isPath: Bool {
        self == .origin || self == .extraPath
    }
}

public struct DVertex {
    
    public static let empty = DVertex(index: .empty, point: .zero, type: .origin)
    
    public let index: Int
    public let point: FixVec
    public let type: DVType

    @inlinable
    public init(index: Int, point: FixVec, type: DVType) {
        self.index = index
        self.point = point
        self.type = type
    }
    
}
