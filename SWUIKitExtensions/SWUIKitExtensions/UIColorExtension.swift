//
//  UIColorExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public extension UIColor {
    public var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white >= 0.5
    }
    public var isDark: Bool { return !isLight }
}

public extension UIColor {
    convenience init(r red: CGFloat, g green: CGFloat, b blue: CGFloat, a alpha: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    convenience init(r red: CGFloat, g green: CGFloat, b blue: CGFloat) {
        self.init(r: red, g: green, b: blue, a: 1)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        let red = CGFloat(((hex & 0xFF0000) >> 16))
        let green = CGFloat(((hex & 0xFF00) >> 8))
        let blue = CGFloat((hex & 0xFF))
        self.init(r: red, g: green, b: blue, a: alpha)
    }
    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1)
    }
    
    convenience init(h hue: CGFloat, s saturation: CGFloat, b brightness: CGFloat, a alpha: CGFloat) {
        self.init(hue: hue / 256, saturation: saturation / 256, brightness: brightness / 256, alpha: alpha)
    }
    convenience init(h hue: CGFloat, s saturation: CGFloat, b brightness: CGFloat) {
        self.init(h: hue, s: saturation, b: brightness, a: 1)
    }
}

public extension UIColor {
    /// Return RGB value of current color.
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        return (fRed, fGreen, fBlue, fAlpha)
    }
}

public extension UIColor {
    struct Flat {
        static var turquoise:   UIColor { return UIColor(r: 26,     g:  188,    b:  156     ) }
        static var greenSea:    UIColor { return UIColor(r: 22.0,   g: 160.0,   b: 133.0    ) }
        static var emerald:     UIColor { return UIColor(r: 46.0,   g: 204.0,   b: 113.0    ) }
        static var nephritis:   UIColor { return UIColor(r: 39.0,   g: 174.0,   b: 96.0     ) }
        static var peterRiver:  UIColor { return UIColor(r: 52.0,   g: 152.0,   b: 219.0    ) }
        static var belizeHole:  UIColor { return UIColor(r: 41.0,   g: 128.0,   b: 185.0    ) }
        static var amethyst:    UIColor { return UIColor(r: 155.0,  g: 89.0,    b: 182.0    ) }
        static var wisteria:    UIColor { return UIColor(r: 142.0,  g: 68.0,    b: 173.0    ) }
        static var wetAsphalt:  UIColor { return UIColor(r: 52.0,   g: 73.0,    b: 94.0     ) }
        static var midNight:    UIColor { return UIColor(r: 44.0,   g: 62.0,    b: 80.0     ) }
        static var sunFlower:   UIColor { return UIColor(r: 241.0,  g: 196.0,   b: 15.0     ) }
        static var orange:      UIColor { return UIColor(r: 243.0,  g: 156.0,   b: 18.0     ) }
        static var carrot:      UIColor { return UIColor(r: 230.0,  g: 126.0,   b: 34.0     ) }
        static var pumpkin:     UIColor { return UIColor(r: 211.0,  g: 84.0,    b: 0.0      ) }
        static var alizarin:    UIColor { return UIColor(r: 231.0,  g: 76.0,    b: 60.0     ) }
        static var pomegranate: UIColor { return UIColor(r: 192.0,  g: 57.0,    b: 43.0     ) }
        static var cloud:       UIColor { return UIColor(r: 236.0,  g: 240.0,   b: 241.0    ) }
        static var silver:      UIColor { return UIColor(r: 189.0,  g: 195.0,   b: 199.0    ) }
        static var concrete:    UIColor { return UIColor(r: 149.0,  g: 165.0,   b: 166.0    ) }
        static var asbestos:    UIColor { return UIColor(r: 127.0,  g: 140.0,   b: 141.0    ) }
    }
}

// MARK: Color picker
extension UIColor {

}
