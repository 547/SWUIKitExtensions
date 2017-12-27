//
//  UIDeviceExtension.swift
//  iFoodMacau-Delivery
//
//  Created by Jason Lee on 19/06/2017.
//  Copyright © 2017 Supernova Software. All rights reserved.
//

import UIKit

public extension UIDevice {
    var modelType: ModelType {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return ModelType(identifier: identifier)
    }
    var isSimulator: Bool { return modelType == .simulator }
}

public extension UIDevice {
    enum ModelType: String {
        case simulator
        case undefined
        
        var name: String {
            return self.rawValue
        }
        
        init(identifier: String) {
            switch identifier {
            case "i386", "x86_64":  self = .simulator
            default:                self = .undefined 
            }
        }
    }
}
