//: Playground - noun: a place where people can play

import UIKit



func fixTime(time:String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = formatter.date(from: time)
    
    if date!.timeIntervalSinceNow + 14400 < 0 {
        return "00:00:00"
    }
    
    let a = date!.timeIntervalSinceNow + 14400
    
    let ss = Int(a) % 60
    var mm = (Int(a) - ss) / 60
    let hh = (mm > 59) ? (mm / 60) : 00
    if hh > 0 {
        mm = mm % 60
    }
    
    let h = String(format:"%02d",hh)
    let m = String(format:"%02d",mm)
    let s = String(format:"%02d",ss)
    return "\(h):\(m):\(s)"
}

let a = fixTime(time: "2017-04-29 19:30:22")
a
/*
var time: TimeInterval = 12345531
Date(timeIntervalSinceNow: time)


let dateString = "2017/04/29 18:24:13.2131313".components(separatedBy: ".").first!

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
var date = formatter.date(from: dateString)

if date!.timeIntervalSinceNow + 14400 < 0 {
    print("超過")
}

let a = date!.timeIntervalSinceNow + 14400

let ss = Int(a) % 60
var mm = (Int(a) - ss) / 60
let hh = (mm > 59) ? (mm / 60) : 0
if hh > 0 {
    mm = mm % 60
}

let h = String(format:"%02d",hh)
let m = String(format:"%02d",mm)
let s = String(format:"%02d",ss)

print(h, m, s)

Date(timeIntervalSinceReferenceDate: a)
*/
