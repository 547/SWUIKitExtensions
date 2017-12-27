//
//  UISearchBarExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 25/09/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension UISearchBar {
    var textField: UITextField? {
        return value(forKey: "_searchField") as? UITextField
    }
}
