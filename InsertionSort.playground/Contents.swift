//: Playground - noun: a place where people can play

import UIKit

typealias CRITERIA<T> = (T,T) -> Bool

func insertionSortOf<T: Comparable>(
    _ coll: Array<T>,
    byCriteria: CRITERIA<T> = { $0 < $1 }) -> Array<T> {
    
    guard coll.count > 1 else {
        return coll
    }
    
    var result = coll
    
    
    for (index, value) in coll.enumerated() {
        print("Get: \(value)")
        
        var i = index
        while i > 0 && byCriteria(value, result[i - 1]) {
            print("-----------------------------")
            print("Remove: \(result[i]) at pos: \(i)")
            print("Insert: \(value) at pos: \(i - 1)")
            print("-----------------------------")
            
            
            result.remove(at: i)
            result.insert(value, at: i - 1)
            
            i -= 1
        }
    }
    
    // 4. Return the sorted array
    return result
}

let a: Array<Int> = [3,5,8,1]
//insertionSortOf(a)
insertionSortOf(a, byCriteria: >)

