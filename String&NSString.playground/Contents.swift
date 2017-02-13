//: Playground - noun: a place where people can play

import UIKit


"🙎".characters.count
"🙎🏻".characters.count
"👩‍👩‍👦‍👦".characters.count

"👩\u{200d}👩\u{200d}👦\u{200d}👦" == "👩‍👩‍👦‍👦"


extension String: Collection {}

let group = "👩‍👩‍👦‍👦"
group.dropFirst()
