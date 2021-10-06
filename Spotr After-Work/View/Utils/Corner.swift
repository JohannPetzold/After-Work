//
//  Corner.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import Foundation
import SwiftUI

struct Corner {
    
    private static let defaultCornerValue: CGFloat = 15
    private static let tagCornerValue: CGFloat = 7
    
    static func defaultCorner() -> CGFloat {
        return defaultCornerValue
    }
    
    static func tagCorner() -> CGFloat {
        return tagCornerValue
    }
}
