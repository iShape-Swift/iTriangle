//
//  MPoly.swift
//  
//
//  Created by Nail Sharipov on 02.06.2023.
//

struct MPoly {
        
    var next: Int
    var prev: Int

    @inlinable
    init(start: Int) {
        next = start
        prev = start
    }
    
    @inlinable
    init(next: Int, prev: Int) {
        self.next = next
        self.prev = prev
    }

}
