//
//  RoundedButton.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct RoundedButton: View {
    
    var icon: String
    var size: ButtonSize
    var shadow: Bool
    var action: () -> Void
    
    private let shadowRadius: CGFloat = 2
    private let shadowYOffset: CGFloat = 3
    private let coreDataHelper = CoreDataHelper(context: PersistenceController.viewContext)
    
    enum ButtonSize: CGFloat {
        case small = 40
        case medium = 50
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .foregroundColor(Colors.background)
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Colors.primary)
                    .frame(width: size.rawValue/2, height: size.rawValue/2)
            }
        }
        .frame(width: size.rawValue, height: size.rawValue)
        .cornerRadius(size.rawValue/2)
        .shadow(color: Colors.primary.opacity(0.3), radius: shadow ? shadowRadius : 0, x: 0, y: shadow ? shadowYOffset : 0)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.yellow
                RoundedButton(icon: Icon.linkIcon(), size: .small, shadow: false, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
            ZStack {
                Color.yellow
                RoundedButton(icon: Icon.linkIcon(), size: .medium, shadow: true, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
            ZStack {
                Color.yellow
                RoundedButton(icon: Icon.bookmarkIcon(state: .selected), size: .medium, shadow: true, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
            ZStack {
                Color.yellow
                RoundedButton(icon: Icon.bookmarkIcon(state: .unselected), size: .small, shadow: false, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
        }
    }
}
