//: Playground - noun: a place where people can play

import UIKit

var str:String? = "Hello, playground"
str?.components(separatedBy: "|")

str = nil
str?.components(separatedBy: "|")


str = ""
str?.components(separatedBy: "|")

str = "He|llo, play|ground"
str?.components(separatedBy: "|")