//
//  UITextViewExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public extension UITextView {
    var length: Int { 
        guard let text = text else { return 0 }
        return text.count
    }
    var isEmpty: Bool { return length <= 0 }
}

public extension UITextView {
    func clean() {
        text = ""
    }
    
    func append(text: String, newLine: Bool = false) {
        if self.text == nil { self.text = "" }
        self.text = self.text + (newLine ? "\n" : "") + text
    }
}
