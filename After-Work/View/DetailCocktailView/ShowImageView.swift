//
//  ShowImageView.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import SwiftUI

struct ShowImageView: View {
    
    @Binding var cocktail: Cocktail
    @Binding var showImage: Bool
    
    var body: some View {
            ZStack(alignment: .top) {
                Rectangle().foregroundColor(.black).opacity(Opacity.backgroundOpacity())
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    CellImage(cocktail: $cocktail)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(Corner.defaultCorner())
                    Spacer()
                }
                .padding(.horizontal, 10)
            }
            .onTapGesture {
                showImage = false
            }
    }
}

struct ShowImageView_Previews: PreviewProvider {
    static var previews: some View {
        ShowImageView(cocktail: .constant(Cocktail.previewCocktail()), showImage: .constant(true))
    }
}
