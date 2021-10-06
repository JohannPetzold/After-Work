//
//  Font.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import Foundation
import SwiftUI

struct Font {
    
    private static var primaryFontString = "Roboto"
    
    private static var largeTitleFontSize: CGFloat = 40
    private static var titleFontSize: CGFloat = 30
    private static var subtitleFontSize: CGFloat = 24
    private static var detailFontSize: CGFloat = 15
    private static var tagFontSize: CGFloat = 10
    
    static func primaryFont() -> String {
        return primaryFontString
    }
    
    static func largeTitleSize() -> CGFloat {
        return largeTitleFontSize
    }
    
    static func titleSize() -> CGFloat {
        return titleFontSize
    }
    
    static func subtitleSize() -> CGFloat {
        return subtitleFontSize
    }
    
    static func detailSize() -> CGFloat {
        return detailFontSize
    }
    
    static func tagSize() -> CGFloat {
        return tagFontSize
    }
}
