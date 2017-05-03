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

let utfStr = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=25.039328,121.5766562&language=zh-TW&rankby=distance&keyword=咖啡".addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed)!

//print(utfStr + "&key=AIzaSyD6crA7UUfb94yJlAmbjgbS1lRI4l4wTSU")



let ss = "http://sandbox.api.simsimi.com/request.p?key=7fc6a39d-5bdd-4e2d-9435-c7d52ab7dd54&lc=zh&text=誒誒誒誒誒誒".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

print(ss!)

"%E8%AA%92%E8%AA%92"

print("http://sandbox.api.simsimi.com/request.p?key=7fc6a39d-5bdd-4e2d-9435-c7d52ab7dd54&lc=zh&text=你好".addingPercentEncoding(withAllowedCharacters: .urlUserAllowed)!)





