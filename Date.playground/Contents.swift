//: Playground - noun: a place where people can play

import UIKit



var dateString = "106年02月15日 下午 16:33"

let formatter = DateFormatter()
formatter.dateFormat = "yyy年MM月dd日 a HH:mm"//"yyy年MM月dd日"
let rocCalendar = NSCalendar.init(identifier: NSCalendar.Identifier.republicOfChina)
formatter.calendar = rocCalendar as Calendar!
formatter.locale = Locale(identifier: "zh-TW")
var date = formatter.date(from: dateString)

dateString.components(separatedBy: "年").last
//componentsSeparatedByString("年")
date?.timeIntervalSinceNow
Date().timeIntervalSinceNow

78561/3600

extension Date {
    func fom() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy年MM月dd日"
        let rocCalendar = NSCalendar.init(identifier: NSCalendar.Identifier.republicOfChina)
        formatter.calendar = rocCalendar as Calendar!
        formatter.locale = Locale(identifier: "zh-TW")
        return formatter.string(from: self)
    }
}

date?.fom()