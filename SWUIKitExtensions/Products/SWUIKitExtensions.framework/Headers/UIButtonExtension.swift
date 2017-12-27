//
//  UIButtonExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit
public extension UIButton {
    public var normalTitle: String? {
        get { return title(for: .normal) }
        set (newValue) { setTitle(newValue, for: .normal) }
    }
    public var highlightedTitle: String? {
        get { return title(for: .highlighted) }
        set (newValue) { setTitle(newValue, for: .highlighted) }
    }
    public var normalTitleColor: UIColor? {
        get { return titleColor(for: .normal) }
        set (newColor) { setTitleColor(newColor, for: .normal) }
    }
    public var highlightedTitleColor: UIColor? {
        get { return titleColor(for: .highlighted) }
        set (newColor) { setTitleColor(newColor, for: .highlighted) }
    }
    public var titleFont: UIFont? {
        get { return titleLabel?.font }
        set (newFont) { titleLabel?.font = newFont }
    }
    public var normalImage: UIImage?{
        get {return image(for: .normal)}
        set (newValue) { setImage(newValue, for: .normal) }
    }
    public var selectedTitleColor:UIColor?{
        get { return titleColor(for: .selected) }
        set (newColor) { setTitleColor(newColor, for: .selected) }
    }
    public var selectedImage: UIImage?{
        get {return image(for: .selected)}
        set (newValue) { setImage(newValue, for: .selected) }
    }
}
public extension UIButton {
    @discardableResult
    public func setNormalTitle(title: String?) -> UIButton {
        setTitle(title, for: .normal)
        return self
    }
    @discardableResult
    public func setNormalTitleColor(color: UIColor) -> UIButton {
        setTitleColor(color, for: .normal)
        return self
    }
    @discardableResult
    public func setTitleFont(font: UIFont) -> UIButton {
        titleLabel?.font = font
        return self
    }
    @discardableResult
    public func setTitleFontSize(size: CGFloat) -> UIButton {
        if let font = titleLabel?.font {
            titleLabel?.font = UIFont(name: font.fontName, size: size)
        }
        return self
    }
    @discardableResult
    public func setNormalImage(image:UIImage?) -> UIButton {
        setImage(image, for: .normal)
        return self
    }
    @discardableResult
    public func setSelectedTitleColor(color: UIColor) -> UIButton {
        setTitleColor(color, for: .selected)
        return self
    }
    @discardableResult
    public func setSelectedImage(image:UIImage?) -> UIButton {
        setImage(image, for: .selected)
        return self
    }
}
