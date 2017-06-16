//: Playground - noun: a place where people can play

import UIKit

class Dog: NSObject {
    var name = "SB"
}

var dogArray: [Dog] = []


for _ in 1 ... 10 {
    dogArray.append(Dog())
}

var dog_name_array = dogArray.map {
    $0.name
}

print(dog_name_array)
