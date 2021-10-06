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
        
        func iconWidth() -> CGFloat {
            switch self {
            case .link:
                return 20
            case .close:
                return 20
            case .bookmarkSelected:
                return 14
            case .bookmarkUnselected:
                return 14
            }
        }
        
        func iconHeight() -> CGFloat {
            switch self {
            case .link:
                return 20
            case .close:
                return 20
            case .bookmarkSelected:
                return 18.65
            case .bookmarkUnselected:
                return 18.65
            }
        }
    }
    
    static func bookmarkIcon(state: IconName) -> String {
        return state.rawValue
    }
    
    static func linkIcon() -> String {
        return IconName.link.rawValue
    }
    
    static func closeIcon() -> String {
        return IconName.close.rawValue
    }
}
