//: Playground - noun: a place where people can play

import UIKit


class Person {
    
    var name:String = ""
    var isAdult = false
    var age:Int = 0 {
        didSet {
            if age >= 18 { isAdult = true }
        }
    }
}

let student = Person()
student.name = "Jack"
student.age = 18
student.isAdult




