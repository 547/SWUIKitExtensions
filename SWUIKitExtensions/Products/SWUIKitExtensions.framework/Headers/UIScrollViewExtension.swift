//
//  UIScrollViewExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 03/08/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height)
        setContentOffset(bottomOffset, animated: animated)
    }
}
