//
//  TagText.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct TagText: View {
    
    @Binding var tag: String
    
    private let corner: CGFloat = 10
    private let vPadding: CGFloat = 10
    private let hPadding: CGFloat = 15
    
    var body: some View {
        Text(tag)
            .bold()
            .font(.caption)
            .foregroundColor(Colors.primary)
            .padding(EdgeInsets(top: vPadding, leading: hPadding, bottom: vPadding, trailing: hPadding))
            .background(
                Rectangle()
                    .foregroundColor(Colors.secondary)
                    .cornerRadius(corner)
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
