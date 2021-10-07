//
//  Icon.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation
import SwiftUI

struct Icon {
    
    enum IconName: String {
        case link = "globe"
        case close = "xmark.circle"
        case bookmarkSelected = "bookmark.fill"
        case bookmarkUnselected = "bookmark"
        case send = "square.and.arrow.up"
        case chevronDown = "chevron.down"
        case chevronUp = "chevron.up"
        
        func iconWidth() -> CGFloat {
            switch self {
            case .link:
                return 20
            case .close:
                return 20
            case .bookmarkSelected, .bookmarkUnselected:
                return 14
            case .send:
                return 15
            case .chevronDown, .chevronUp:
                return 15
            }
        }
        
        func iconHeight() -> CGFloat {
            switch self {
            case .link:
                return 20
            case .close:
                return 20
            case .bookmarkSelected, .bookmarkUnselected:
                return 18.65
            case .send:
                return 20
            case .chevronDown, .chevronUp:
                return 15
            }
        }
    }
    
    static func getIconName(_ iconName: IconName) -> String {
        return iconName.rawValue
    }
}
