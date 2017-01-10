//: Playground - noun: a place where people can play

import UIKit

// MARK:- @autoclosure
func showGameOver(score:Int, isOver:@autoclosure ()->Bool) {
    if isOver() {
        print("遊戲結束，您獲得\(score)分")
    }
}
var score = 99
showGameOver(score: score, isOver: score>50)









// MARK:- ??
var num_1: Int?

var num_2 = num_1 ?? 5

func a<T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return try defaultValue()
    }
}

a(optional: num_1, defaultValue: 5)


// MARK:- &&
var bool_1 = Bool(arc4random_uniform(2) as NSNumber)
var bool_2 = Bool(arc4random_uniform(2) as NSNumber)

let bool_3 = bool_1 && bool_2

func b(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool {
    return lhs ? try rhs() : false;
}

b(lhs: bool_1, rhs: bool_2)

// MARK:- ||
let bool_4 = bool_1 || bool_2

func c(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool {
    return lhs ? lhs : try rhs()
}

c(lhs: bool_1, rhs: bool_2)



