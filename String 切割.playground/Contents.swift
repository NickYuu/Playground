//: Playground - noun: a place where people can play

import UIKit

var str = "2017-04-18 22:14:46.946000"
var ns2=(str as NSString).substring(to: 4)
let index = str.index(str.startIndex, offsetBy: 16)
str.substring(to: index)