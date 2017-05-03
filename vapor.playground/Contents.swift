//: Playground - noun: a place where people can play

import UIKit


// get 方法
drop.get() { req in
    
    // get 參數只有一個text
    guard let text = req.data["text"]?.string else {
        return Response(status: .ok, body: "this message is not supported") }
    
    // call 這隻api 拿到 response
    let response = try drop.client.request(.get, "http://sandbox.api.simsimi.com/request.p?lc=zh",
                    query: [
                        "lc":"zh",
                        "text":text,
                        "key":"7809c250-85c1-4321-85d4-7d9cc9d71e0f"
                        ])

    // 回傳這個response的json
    return response
}

