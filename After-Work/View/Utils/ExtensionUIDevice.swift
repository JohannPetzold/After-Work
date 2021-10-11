//
//  ExtensionUIDevice.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import Foundation
import UIKit

extension UIDevice {
    
    var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.first{ $0.isKeyWindow }?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
