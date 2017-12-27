//
//  UITableViewExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 25/07/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import Foundation

public extension UITableView {
    func dequeueReusableCell<T>(withIdentifier identifier: String, _ initClosure: () -> T) -> T {
        return dequeueReusableCell(withIdentifier: identifier) as? T ?? initClosure()
    }
}
