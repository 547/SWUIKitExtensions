//
//  UIStoryboardExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    convenience public init(inProjectName name: String) {
        self.init(name: name, bundle: nil)
    }
}

public extension UIStoryboard {
    static func instantiateViewController<T>(fromStoryboard named: String, withClass type: AnyClass) -> T? {
        let storyboard = UIStoryboard(inProjectName: named)
        return storyboard.instantiateViewController(withIdentifier: String(describing: type)) as? T
    }
}
