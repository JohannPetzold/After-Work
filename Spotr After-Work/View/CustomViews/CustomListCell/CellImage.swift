//
//  CellImage.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI
import UIKit

struct CellImage: View {
    
    @Binding var imageName: String
    
    var body: some View {
        if let loadImage = UIImage(named: imageName) {
            Image(uiImage: loadImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
        } else {
            Rectangle()
                .foregroundColor(.gray)
        }
    }
}

struct CellImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CellImage(imageName: .constant("Mojito"))
                .previewLayout(.fixed(width: 300, height: 300))
            CellImage(imageName: .constant(""))
                .previewLayout(.fixed(width: 300, height: 250))
        }
    }
}
