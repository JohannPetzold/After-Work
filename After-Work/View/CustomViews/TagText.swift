//
//  TagText.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct TagText: View {
    
    @Binding var tag: String
    
    private let vPadding: CGFloat = 10
    private let hPadding: CGFloat = 15
    
    var body: some View {
        Text(tag)
            .font(.custom(Font.boldFont(), size: Font.tagSize()))
            .bold()
            .foregroundColor(Colors.secondary)
            .padding(EdgeInsets(top: vPadding, leading: hPadding, bottom: vPadding, trailing: hPadding))
            .background(
                Rectangle()
                    .foregroundColor(Colors.secondary.opacity(Opacity.tagOpacity()))
                    .cornerRadius(Corner.tagCorner())
            )
    }
}

struct TagText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TagText(tag: .constant("CONTEMPORARYCLASSIC"))
                .previewLayout(.fixed(width: 300, height: 70))
            TagText(tag: .constant("FRUITY"))
                .previewLayout(.fixed(width: 300, height: 70))
            TagText(tag: .constant("DARK"))
                .previewLayout(.fixed(width: 300, height: 70))
        }
        
    }
}
