//
//  Font.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import Foundation
import SwiftUI

struct Font {
    
    private static let blackFontString = "Roboto-Black"
    private static let regularFontString = "Roboto-Regular"
    private static let boldFontString = "Roboto-Bold"
    private static let mediumFontString = "Roboto-Medium"
    
    private static let largeTitleFontSize: CGFloat = 40
    private static let titleFontSize: CGFloat = 30
    private static let subtitleFontSize: CGFloat = 24
    private static let detailFontSize: CGFloat = 15
    private static let tagFontSize: CGFloat = 10
    
    static func blackFont() -> String {
        return blackFontString
    }
    
    static func regularFont() -> String {
        return regularFontString
    }
    
    static func boldFont() -> String {
        return boldFontString
    }
    
    static func mediumFont() -> String {
        return mediumFontString
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
