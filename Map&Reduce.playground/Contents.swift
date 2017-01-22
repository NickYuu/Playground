//: Playground - noun: a place where people can play

import UIKit

func toEmoji(str: String) -> Character {
    let tmp = "\\N{\(str)}"
    
    let emojiStr = tmp.applyingTransform(StringTransform.toUnicodeName, reverse: true)
    
    return emojiStr!.characters.first!
}