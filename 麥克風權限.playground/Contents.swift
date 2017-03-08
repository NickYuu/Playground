//: Playground - noun: a place where people can play

import UIKit
import AVFoundation

let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)

if status == .authorized {
    // 用戶允許
    
} else if status == .restricted {
    // 未授權 例如家長控制
    
} else if status == .notDetermined {
    // 沒有詢問過是否允許
    AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) {
        success in
        if !success {
            print("Come on, it's a camera app!")
            return  
        }
    }
    
} else if status == .denied {
    // 用戶拒絕授權
    let alertController = UIAlertController(title: "定位權限已關閉", message: "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟", preferredStyle: .alert)
    let okAction = UIAlertAction( title: "確認", style: .default, handler:nil)
    alertController.addAction(okAction)
    //self.presentViewController(alertController, animated: true, completion: nil)

}