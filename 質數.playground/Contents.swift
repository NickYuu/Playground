//: Playground - noun: a place where people can play

import UIKit



var a = 239

func f1(num: Int) {
    let start = CACurrentMediaTime()
    var list = [Int]()
    var drop = [Int]()
    
    for i in (2...a) {
        if drop.contains(i) {
            continue
        }
        var count = 0
        for j in 2...i {
            if i % j == 0 {
                count += 1
            }
            if count == 2 {
                continue
            }
        }
        if count == 1 {
            list.append(i)
            if 23/i > 2 {
                for k in 2...num/i {
                    if !drop.contains(i*k) {
                        drop.append(i*k)
                    }
                }
            }
        }
    }
    let end = CACurrentMediaTime()
    print("時間：\(end - start)")
    print(list)
}

func f2(num: Int) {
    let start = CACurrentMediaTime()
    var list = [Int]()
    for i in 2...a {
        var count = 0
        for j in 2...i {
            if i % j == 0 {
                count += 1
            }
            if count == 2 {
                continue
            }
        }
        if count == 1 {
            list.append(i)
        }
    }
    let end = CACurrentMediaTime()
    print("時間：\(end - start)")
    print(list)
}

f1(num: a)
f2(num: a)

