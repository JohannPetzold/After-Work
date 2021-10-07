//
//  Transitions.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 07/10/2021.
//

import Foundation
import SwiftUI

struct Transitions {
    
    private static let showDetailImageTransition = AnyTransition.opacity.animation(.easeInOut(duration: 0.4))
    private static let showCellTransition = AnyTransition.opacity.animation(.easeIn(duration: 0.2))
    private static let cellAppearTransition = AnyTransition.scale.animation(.easeInOut(duration: 0.5))
    
    static func showDetailImage() -> AnyTransition {
        return showDetailImageTransition
    }
    
    static func showCell() -> AnyTransition {
        return showCellTransition
    }
    
    static func cellAppear() -> AnyTransition {
        return cellAppearTransition
    }
}
