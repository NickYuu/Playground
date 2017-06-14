//: Playground - noun: a place where people can play

import Foundation

let text = " text123😄"

//for commitChar in text.unicodeScalars {
//    print(Int(commitChar.value))
//    if ((commitChar.value>=0x4e00)&&(commitChar.value<=0x9FA5)) {
//        print("中文")
//    }
//    else if((commitChar.value>64)&&(commitChar.value<91)) {
//        print("大寫英文")
//    }
//    else if((commitChar.value>96)&&(commitChar.value<123)) {
//        print("小寫英文")
//    }
//    else if((commitChar.value>47)&&(commitChar.value<58)) {
//        print("數字")
//    }
//    else{
//        print("其他")
//    }
//}



func addSuffixStr(_ text: String) -> String {
    
    for commitChar in text.unicodeScalars {
        
        if ((commitChar.value>=0x4e00)&&(commitChar.value<=0x9FA5)) {
            return text
        }
    }
    return text + " "
}
var msg = "性科藥姓名: 病歷號: · ( 45 歲) 宀政達017632 身06 / 04 / 13 保診總袋i/ 1 凱傑內含: 4 種藥品( 健保給付藥) ( 健保給付藥) 5 天, 共15 · 錠每次1. 錠1 Ⅶ 炎克膜衣錠10 囗服日三次5 天, 共7 · 5 錠每次0 , 5 錠SU 抒疼錠200 EP 昍囗服每日三次5 天, 共15 · 粒每次l. 粒200 Ⅵ Ⅰ D Ⅰ NE 胃得鎮錠( 囗服每日三次5 夭, 共15 · 粒每次1. 粒SERNVITA(ALINAMIN-F) 50M 囗服每日三次* 可能的副作用, 並非每個人都會發生, 若您發現有副作用時, 請立即停藥並詢間醫師或藥師"
addSuffixStr(text)


URL(string: "https://westus.api.cognitive.microsoft.com/luis/v2.0/apps/eba66c07-9d05-4c60-b9b5-1a50cc43a701?verbose=true&timezoneOffset=0q=\(msg.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)")!
