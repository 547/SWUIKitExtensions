//
//  UITextFieldExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public extension UITextField {
    var length: Int { 
        guard let text = text else { return 0 }
        return text.count
    }
    var isEmpty: Bool { return length <= 0 }
}

public extension UITextField {
    func clean() { text = "" }
}
