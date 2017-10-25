//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

public func with<T>(_ item: T, update: (inout T) throws -> Void) rethrows -> T {
    var this = item; try update(&this); return this
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        
        _ = with(UILabel()) {
            $0.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
            $0.text = "Hello World!"
            $0.textColor = .black
            view.addSubview($0)
        }
        
        
        
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
/*
class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        
        let _: UILabel = {
            $0.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
            $0.text = "Hello World!"
            $0.textColor = .black
            view.addSubview($0)
            return $0
        }(UILabel())
        
        
        
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
 */
