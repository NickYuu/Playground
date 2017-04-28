//: Playground - noun: a place where people can play

import UIKit

var arr = [1,2,4,5,6,1,3,42,3,12,123,31,3]

//arr[0..<3]

if arr.count > 5{
    arr = arr.enumerated().filter({ $0.offset < 5}).map {$0.element}
}

arr