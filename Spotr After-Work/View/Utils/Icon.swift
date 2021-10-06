//
//  Icon.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation

struct Icon {

    private static var linkIconStr = "globe"
    private static var closeIconStr = "xmark.circle"
    
    enum BookmarkState: String {
        case selected = "bookmark.fill"
        case unselected = "bookmark"
    }
    
    static func bookmarkIcon(state: BookmarkState) -> String {
        return state.rawValue
    }
    
    static func linkIcon() -> String {
        return Icon.linkIconStr
    }
    
    static func closeIcon() -> String {
        return Icon.closeIconStr
    }
}
