//: Playground - noun: a place where people can play

import UIKit

/*
 
 有一個陣列，轉換成字典key為陣列元素，value為此元素在陣列中的數量
 ["😡", "😻", "🚗", "😡", "🚗", "🚗", "😡", "😻"]
 轉換成
 ["😡": 3, "😻": 2, "🚗": 3]
 
 
 */

extension Array where Element: Equatable, Element == String {
    func duplicatesToDic() -> [String:Int] {
        let arr = reduce([]){ $0.contains($1) ? $0 : $0 + [$1] }
        var dic: [String: Int] = [:]
        arr.forEach { key in
            dic[key] = 0
            self.forEach {
                if $0 == key {
                    dic[key]! += 1
                }
            }
        }
        return dic
    }
}

let arr = ["😡", "😻", "🚗", "😡", "🚗", "🚗", "😡", "😻"]
print(arr.duplicatesToDic())


