//: Playground - noun: a place where people can play

import UIKit

var fibonacci = [0, 1, 1, 2, 3, 5]
var squares = [Int]()

for value in fibonacci {
    squares.append(value * value)
}

// [0, 1, 1, 4, 9, 25]
let constSquares = fibonacci.map { $0 * $0 }
constSquares

extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var tmp: [T] = []
        tmp.reserveCapacity(count)
        
        for value in self {
            tmp.append(transform(value))
        }
        
        return tmp
    }
}

