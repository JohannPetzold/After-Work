//
//  RoundedButton.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct RoundedButton: View {
    
    var icon: Icon.IconName
    var size: ButtonSize
    var shadow: Bool
    var largerTouch: CGFloat = 1.0
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
                if largerTouch != 1.0 {
                    Rectangle().opacity(0)
                        .cornerRadius(size.rawValue * largerTouch / 2)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.white)
                    Image(systemName: icon.rawValue)
                        .resizable()
                        .foregroundColor(Colors.secondary)
                        .frame(width: icon.iconWidth(), height: icon.iconHeight())
                }
                .frame(width: size.rawValue, height: size.rawValue)
                .cornerRadius(size.rawValue / 2)
            }
        }
        .frame(width: size.rawValue * largerTouch, height: size.rawValue * largerTouch)
        .shadow(color: Colors.secondary.opacity(Opacity.shadowButtonOpacity()), radius: shadow ? shadowRadius : 0, x: 0, y: shadow ? shadowYOffset : 0)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.yellow
                RoundedButton(icon: .link, size: .small, shadow: false, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
            ZStack {
                Color.yellow
                RoundedButton(icon: .link, size: .medium, shadow: true, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
            ZStack {
                Color.yellow
                RoundedButton(icon: .bookmarkSelected, size: .medium, shadow: true, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
            ZStack {
                Color.yellow
                RoundedButton(icon: .bookmarkUnselected, size: .small, shadow: false, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
            ZStack {
                Color.yellow
                RoundedButton(icon: .close, size: .small, shadow: false, largerTouch: 2, action: { })
            }
            .previewLayout(.fixed(width: 100, height: 100))
            ZStack {
                Color.yellow
                RoundedButton(icon: .close, size: .medium, shadow: true, largerTouch: 2, action: { })
            }
            .previewLayout(.fixed(width: 150, height: 150))
        }
    }
}
