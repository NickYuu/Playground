//: Playground - noun: a place where people can play

import UIKit

var array = ["1","2","3","4","5","6","7","8","9","10"]

//1.轉INT
//2.去除偶數
//3.全部＋1
//4.由大到小

let arr = array
    .map    { Int($0)! }
    .filter { $0 % 2 == 1 }
    .map    { $0 + 1 }
    .sorted { $0 > $1 }

print(arr)