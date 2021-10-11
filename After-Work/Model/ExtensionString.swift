//
//  ExtensionString.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 11/10/2021.
//

import Foundation

extension String {
    
    func getProperMeasure() -> String {
        var result = self.replacingOccurrences(of: "\\n", with: "")
        result = self.replacingOccurrences(of: "\\", with: "")
        return result
    }
}
