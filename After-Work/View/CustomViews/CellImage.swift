//
//  CellImage.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI
import UIKit

struct CellImage: View {
    
    @Binding var cocktail: Cocktail
    
    @StateObject var imageLoader = ImageLoaderService()
    @State var image = UIImage()
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            GeometryReader { geometry in
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        imageLoader.loadCocktailImage(cocktail: cocktail)
                    }
            }
        }
    }
}

struct CellImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CellImage(cocktail: .constant(Cocktail.previewCocktail()))
                .previewLayout(.fixed(width: 300, height: 300))
            CellImage(cocktail: .constant(Cocktail()))
                .previewLayout(.fixed(width: 300, height: 250))
        }
    }
}
