//
//  Animations.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 07/10/2021.
//

import Foundation
import SwiftUI

struct Animations {
    
    private static let expandCellAnimation = Animation.spring(response: 0.5, dampingFraction: 0.9, blendDuration: 0.2)
    private static let showIngredientAnimation = Animation.easeInOut(duration: 0.4)
    private static let unselectAnimation = Animation.easeInOut(duration: 0.5)
    
    enum ExpandAnimationName: String {
        case text = "Text"
        case image = "Image"
        case bookmark = "Bookmark"
    }
    
    static func expandCell() -> Animation {
        return expandCellAnimation
    }
    
    static func showIngredient() -> Animation {
        return showIngredientAnimation
    }
    
    static func unselect() -> Animation {
        return unselectAnimation
    }
    
    static func expandName(_ name: ExpandAnimationName) -> String {
        return name.rawValue
    }
}
