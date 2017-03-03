//: Playground - noun: a place where people can play

import UIKit

public extension Array {
    
    /// 隨機取出陣列中的元素
    public var randomItem: Element {
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
    
}

[2,4,5,6,7].randomItem

public extension Collection where Iterator.Element == Int, Index == Int {
    
    /// 取整數陣列的平均值
    public var average: Double {
        return isEmpty ? 0 : Double(reduce(0, +)) / Double(endIndex-startIndex)
    }
    
}
[4,2,1,1].average


public extension Array where Element: Integer {
    
    
    /// 取整數陣列的總和
    public var sum: Element {
        return reduce(0, +)
    }
    
}

[1, 31, 1].sum



public extension Array where Element: FloatingPoint {
    
    /// 取浮點數陣列的平均值
    public var average: Element {
        return isEmpty ? 0 : reduce(0, +) / Element(count)
    }
    
    /// 取浮點數陣列的總和
    public var sum: Element {
        return reduce(0, +)
    }
    
}
[1.2, 31, 1].average
[1.2, 31, 1].sum



public extension Array where Element: Equatable {
    
    /// SwifterSwift: Shuffle array.
    public mutating func shuffle() {
        let arr = self
        for _ in 0..<10 {
            sort { (_,_) in arc4random() < arc4random() }
        }
        if self == arr {
            shuffle()
        }
    }
    
    /// SwifterSwift: Check if array contains an array of elements.
    ///
    /// - Parameter elements: array of elements to check.
    /// - Returns: true if array contains all given items.
    public func contains(_ elements: [Element]) -> Bool {
        guard !elements.isEmpty else { // elements array is empty
            return true
        }
        var found = true
        for element in elements {
            if !contains(element) {
                found = false
            }
        }
        return found
    }
    
    /// SwifterSwift: All indexes of specified item.
    ///
    /// - Parameter item: item to check.
    /// - Returns: an array with all indexes of the given item.
    public func indexes(of item: Element) -> [Int] {
        var indexes: [Int] = []
        for index in 0..<count {
            if self[index] == item {
                indexes.append(index)
            }
        }
        return indexes
    }
    
    /// SwifterSwift: Remove all instances of an item from array.
    ///
    /// - Parameter item: item to remove.
    public mutating func removeAll(_ item: Element) {
        self = filter { $0 != item }
    }
    
    /// SwifterSwift: Remove all duplicates from array.
    public mutating func removeDuplicates() {
        // Thanks to https://github.com/sairamkotha for improving the method
        self = reduce([]){ $0.contains($1) ? $0 : $0 + [$1] }
    }
    
}


// MARK: - Properties (Equatable)
public extension Array where Element: Equatable {
    
    /// SwifterSwift: Shuffled version of array.
    public var shuffled: [Element] {
        var arr = self
        arr.shuffle()
        return arr
    }
    
    /// SwifterSwift: Array with all duplicates removed from it.
    public var withoutDuplicates: [Element] {
        // Thanks to https://github.com/sairamkotha for improving the preperty
        return reduce([]){ ($0 as [Element]).contains($1) ? $0 : $0 + [$1] }
    }
    
}

//[12,1,4,1].shuffled


// MARK: - Methods
public extension Array {
    
    /// SwifterSwift: Element at the given index if it exists.
    ///
    /// - Parameter index: index of element.
    /// - Returns: optional element (if exists).
    public func item(at index: Int) -> Element? {
        guard 0..<count ~= index else { return nil }
        return self[index]
    }
    
    /// SwifterSwift: First index of a given item in an array.
    ///
    /// - Parameter item: item to check.
    /// - Returns: first index of item in array (if exists).
    public func firstIndex <Item: Equatable> (of item: Item) -> Int? {
        if item is Element {
            for (index, value) in lazy.enumerated() {
                if value as! Item == item {
                    return index
                }
            }
            return nil
        }
        return nil
    }
    
    /// SwifterSwift: Last index of element in array.
    ///
    /// - Parameter item: item to check.
    /// - Returns: last index of item in array (if exists).
    public func lastIndex <Item: Equatable> (of item: Item) -> Int? {
        if item is Element {
            for (index, value) in reversed().lazy.enumerated() {
                if value as! Item == item {
                    return count - 1 - index
                }
            }
            return nil
        }
        return nil
    }
    
    /// SwifterSwift: Remove last element from array and return it.
    ///
    /// - Returns: last element in array (if applicable).
    @discardableResult public mutating func pop() -> Element? {
        guard !isEmpty else { return nil }
        return removeLast()
    }
    
    /// SwifterSwift: Insert an element at the beginning of array.
    ///
    /// - Parameter newElement: element to insert.
    public mutating func prepend(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
    /// SwifterSwift: Insert an element to the end of array.
    ///
    /// - Parameter newElement: element to insert.
    public mutating func push(_ newElement: Element) {
        append(newElement)
    }
    
}
