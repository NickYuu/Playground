//: Playground - noun: a place where people can play

import UIKit

var dic: [String:Any] = ["aa":"name", "bb":"pwd", "cc":12.1234, "dd":0]
let data = NSKeyedArchiver.archivedData(withRootObject: dic)
let dict = NSKeyedUnarchiver.unarchiveObject(with: data) as? [String : Any]