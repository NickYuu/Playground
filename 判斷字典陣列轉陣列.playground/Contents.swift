//: Playground - noun: a place where people can play

import UIKit

var arrayDic: [[String:Any]]

var data: Any

data = [1,23,13,1]

data = ["0":1, "1":23]


let aa = data is [Any] ? data : (data as? [String:Any])?.sorted {Int($0.0.key)! < Int($0.1.key)!}.map {$0.value}

print(aa)
