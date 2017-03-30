//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
extension String {
    public var deletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }
    
    mutating func removeLast() {
        remove(at: self.index(before: self.endIndex))
    }
}

str.removeLast()
