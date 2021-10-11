//
//  Opacity.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import Foundation
import SwiftUI

struct Opacity {
    
    private static let tagValue: CGFloat = 0.2
    private static let backgroundValue: CGFloat = 0.8
    private static let shadowValue: CGFloat = 0.1
    private static let shadowButtonValue: CGFloat = 0.5
    
    static func tagOpacity() -> CGFloat {
        return tagValue
    }
    
    static func backgroundOpacity() -> CGFloat {
        return backgroundValue
    }
    
    static func shadowOpacity() -> CGFloat {
        return shadowValue
    }
    
    static func shadowButtonOpacity() -> CGFloat {
        return shadowButtonValue
    }
}
