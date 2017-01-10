//: Playground - noun: a place where people can play
import UIKit

// This is for dmoe, you can use a generice type to limit your observer to an UIViewController for common usage.
protocol Notifiable {
    var name: Notification.Name { get }
    func observe(by observer: Any, withSelector selector: Selector, object: Any?)
    func post(object: Any? ,userInfo: [AnyHashable: Any]?)
    static func remove(observer: Any)
}


extension Notifiable {
    func observe(by observer: Any, withSelector selector: Selector, object: Any? = nil) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    func post(object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
    
    static func remove(observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
}

class MyClass {
    @objc func handleKeyboardWillShow() {
        print("do after keyboard shows")
    }
    
}

enum Notifier: Notifiable {
    case keyBoardWillHide, keyBoardWillShow
    
    var name: Notification.Name {
        switch self {
        case .keyBoardWillHide:
            return Notification.Name.UIKeyboardWillHide
        case .keyBoardWillShow:
            return Notification.Name.UIKeyboardWillShow
        }
    }
}


let myClass = MyClass()


Notifier.keyBoardWillShow.observe(by: myClass, withSelector: #selector(myClass.handleKeyboardWillShow))
Notifier.keyBoardWillShow.post()

Notifier.remove(observer: myClass)