//: Playground - noun: a place where people can play

import UIKit

typealias Criteria<T> = (T, T) -> Bool
func SelectionSortOf<T: Comparable>(_ coll: Array<T>,
                     byCriteria: Criteria<T> = { $0 > $1 }) -> Array<T> {
    
    guard coll.count > 1 else { return coll }
    
    var result = coll
    
    // 1. Increase the sorted sub array
    for x in 0 ..< coll.count - 1 {
        var candidateIndex = x
        print("--------------------------")
        print("Sorted:\t\(result[0 ..< candidateIndex])")
        print("Unsorted:\t\(result[candidateIndex ..< result.count])")
        
        // 2. Find the next element to be moved into the sorted portion
        for y in x + 1 ..< coll.count {
            if byCriteria(result[candidateIndex], result[y]) {
                candidateIndex = y
            }
        }
        
        // 3. Swap the candidate into sorted sub array if needed
        print(">>> Move \(result[candidateIndex]) into the sorted portion")
        if (candidateIndex != x) {
            swap(&result[candidateIndex], &result[x])
        }
    }
    
    return result
}

let a: Array<Int> = [1, 5, 7, 6]
SelectionSortOf(a)
SelectionSortOf(a, byCriteria: <)

