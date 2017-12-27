//
//  UIViewExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public extension UIView {
    func rectOnWindow() -> CGRect {
        return convert(bounds, to: UIApplication.shared.currentWindow)
    }
}

public extension UIView {
    static var nibName: String { return "\(self)".components(separatedBy: ".").first ?? "" }
    static var nib: UINib? {
        guard let _ = Bundle.main.path(forResource: nibName, ofType: "nib") else { return nil }
        return UINib(nibName: nibName, bundle: nil)
    }
}

public extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set(newValue) {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor? {
        set(newValue) {
            layer.borderColor = newValue?.cgColor
            if let newValue = newValue, newValue != UIColor.clear {
                layer.borderWidth = 1
            }
        }
        get {
            return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set(newValue) {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        set(newValue) {
            layer.shadowColor = newValue?.cgColor
        }
        get {
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
    }
    @IBInspectable var shadowOffset: CGSize {
        set(newValue) {
            layer.shadowOffset = newValue
        }
        get {
            return layer.shadowOffset
        }
    }
    @IBInspectable var shadowRadius: CGFloat {
        set(newValue) {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    @IBInspectable var shadowOpacity: Float {
        set(newValue) {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    @IBInspectable var shadowPath: CGPath? {
        set(newValue) {
            layer.shadowPath = newValue
        }
        get {
            return layer.shadowPath
        }
    }
}

public extension UIView {
    @discardableResult
    public class func instanceFromNib(nibNameOrNil: String? = nil) -> Self? {
        return instanceFromNib(nibNameOrNil: nibNameOrNil, type: self)
    }
    @discardableResult
    public class func instanceFromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibName
        }
        guard let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) else { return nil }
        for tempView in nibViews {
            if let instance = tempView as? T {
                return instance
            }
        }
        return nil
    }
}
public extension UIView {
    //MARK:画圆角（除了image）
    func drawRounded(cornerRadius:CGFloat,borderColor:UIColor?,borderWidth:CGFloat?) -> () {
        self.layer.cornerRadius = cornerRadius
        if borderColor != nil && (borderWidth != nil || borderWidth != 0) {
            self.layer.borderColor = borderColor?.cgColor
            self.layer.borderWidth = borderWidth!
        }
    }
}
