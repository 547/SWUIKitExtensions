//
//  UIImageExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit
import GLKit
import QuartzCore
import OpenGLES

public extension UIImage {
    static func image(fromColor color: UIColor, size: CGSize) -> UIImage? {
        var size = size
        if (size.width, size.height) == (0, 0) {
            size = CGSize(width: 1, height: 1)
        }
        UIGraphicsBeginImageContext(size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: size))
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

public extension UIImage {
    func resized(_ percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    //MARK:旋转图片
    func rotate(orientation:UIImageOrientation) -> UIImage {
        return UIImage.init(cgImage: self.cgImage!, scale: self.scale, orientation: orientation)
    }
}

public extension UIImage {
    //MARK:图片裁剪圆角
    func drawRounded(cornerRadius:CGFloat,size: CGSize) -> UIImage {
        let rect:CGRect = CGRect.init(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        UIGraphicsGetCurrentContext()?.addPath(UIBezierPath.init(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize.init(width: cornerRadius, height: cornerRadius)).cgPath)
        UIGraphicsGetCurrentContext()?.clip()
        self.draw(in: rect)
        UIGraphicsGetCurrentContext()?.drawPath(using: .fillStroke)
        let imageNew = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageNew!
    }
}

// MARK: Color pickers
public extension UIImage {
    public func compressImage(memsize:Int, byteUnits:ByteUnits) -> Data?{
        var compress:CGFloat = 1.0
        var imageData:Data
        if let jpgData = UIImageJPEGRepresentation(self, compress){
            imageData = jpgData
        } else if let pngData = UIImagePNGRepresentation(self){
            imageData = pngData
        } else { return nil }
        let byteSize = byteUnits.getBytes(with: memsize)
        while imageData.count > byteSize && compress > 0.000001 {
            compress -= 0.001
            guard let data = UIImageJPEGRepresentation(self, compress) else { break }
            imageData = data
        }
        return imageData.count > byteSize ? nil : imageData
    }
}
public enum ByteUnits:String {
    case B = "bytes"
    case KB = "k"
    case MB = "m"
    case GB = "g"
    case TB = "t"
    //MARK:转成byte
    func getBytes(with size:Int) -> Int {
        let baseUnit = 1024.0
        switch self {
        case .B:
            return size
        case .KB:
            return size * Int(baseUnit)
        case .MB:
            return size * Int(pow(baseUnit, 2.0))
        case .GB:
            return size * Int(pow(baseUnit, 3.0))
        case .TB:
            return size * Int(pow(baseUnit, 4.0))
        }
    }
    //MARK:向上转换
    func upwardConversion(with bytes:Int) -> Int {
        let baseUnit = 1024.0
        switch self {
        case .B:
            return bytes
        case .KB:
            return bytes / Int(baseUnit)
        case .MB:
            return bytes / Int(pow(baseUnit, 2.0))
        case .GB:
            return bytes / Int(pow(baseUnit, 3.0))
        case .TB:
            return bytes / Int(pow(baseUnit, 4.0))
        }
    }
}
public extension UIImage {
    func changeLightColorBackground(color:UIColor?) -> UIImage? {
        let colorMasking: [CGFloat] = [127, 255, 127, 255, 127, 255]
        let result = changeBackgroundColor(colorMasking: colorMasking, backgroundColor: color)
        return result
    }
    func changeBackgroundColor(colorMasking:[CGFloat], backgroundColor:UIColor?) -> UIImage? {
        if let rawImageRef = cgImage {
            UIGraphicsBeginImageContext(size)
            if let maskedImageRef = rawImageRef.copy(maskingColorComponents: colorMasking), let context: CGContext = UIGraphicsGetCurrentContext() {
                let rect = CGRect(x:0, y:0, width:size.width,
                                  height:size.height)
                if let color = backgroundColor {
                    context.setFillColor(color.cgColor)
                    context.fill(rect)
                }
                context.translateBy(x: 0.0, y: size.height)
                context.scaleBy(x: 1.0, y: -1.0)
                context.draw(maskedImageRef, in: rect)
                let result = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return result
            }
        }
        return nil
    }
}

