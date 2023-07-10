//
//  Array3d.swift
//  
//
//  Created by Nail Sharipov on 08.06.2023.
//

@usableFromInline
struct Array3d<T> {
    
    @usableFromInline
    var a: T
    
    @usableFromInline
    var b: T
    
    @usableFromInline
    var c: T
    
    @inlinable
    init (_ a: T, _ b: T, _ c: T) {
        self.a = a
        self.b = b
        self.c = c
    }

    @inlinable
    subscript(index: Int) -> T {
        get {
            switch index {
                case 0:
                    return a
                case 1:
                    return b
                default:
                    return c
            }
        }
        set {
            switch index {
                case 0:
                    a = newValue
                case 1:
                    b = newValue
                default:
                    c = newValue
            }
        }
    }
}
