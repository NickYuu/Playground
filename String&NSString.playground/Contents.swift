//: Playground - noun: a place where people can play

import UIKit


"🙎".characters.count
"🙎🏻".characters.count
"👩‍👩‍👦‍👦".characters.count

"👩\u{200d}👩\u{200d}👦\u{200d}👦" == "👩‍👩‍👦‍👦"


extension String: Collection {}

let group = "👩‍👩‍👦‍👦"
group.dropFirst()

var str = "周杰倫"
let utf8Data = str.data(using: .utf8)
str = String(data: utf8Data!, encoding: .utf8)!
print(str)

var a = "ads a"
a.replacingOccurrences(of: " ", with: "")

let utfStr = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=25.039328,121.5766562&language=zh-TW&rankby=distance&keyword=咖啡".addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)!

print(utfStr + "&key=AIzaSyD6crA7UUfb94yJlAmbjgbS1lRI4l4wTSU")