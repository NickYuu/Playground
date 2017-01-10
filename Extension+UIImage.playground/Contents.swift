//: Playground - noun: a place where people can play

import UIKit

extension UIImage {
    func thumnailImage() -> UIImage {
        var image = self
        let thumbnailSize =  CGSize(width: 90, height: 90)
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(thumbnailSize, true, scale)
        let widthRatio = thumbnailSize.width / image.size.width
        let heightRadio = thumbnailSize.height / image.size.height
        let ratio = max(widthRatio, heightRadio)
        let imageSize = CGSize(width: image.size.width*ratio, height: image.size.height*ratio)
        image.draw(in: CGRect(x: -(imageSize.width-thumbnailSize.width)/2.0, y: -(imageSize.height-thumbnailSize.height)/2.0, width: imageSize.width, height: imageSize.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

