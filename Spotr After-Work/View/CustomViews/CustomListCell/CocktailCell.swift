//
//  CocktailCell.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct CocktailCell: View {
    
    var cocktail: Cocktail
    @State var showIngredient: Bool = false
    
    private let imageHeight: CGFloat = 350
    private let initialTextHeight: CGFloat = 190
    private let corner: CGFloat = 15
    
    var body: some View {
        VStack {
        ZStack(alignment: .top) {
            ZStack {
                CellImage(imageName: cocktail.name)
                    .frame(height: imageHeight)
                    .cornerRadius(corner)
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                        RoundedButton(icon: Icon.bookmarkIcon(state: .unselected), size: .small, shadow: false)
                    }
                    Spacer()
                }
                .padding()
            }
            .frame(height: imageHeight)
            CellText(showIngredient: $showIngredient, cocktail: cocktail)
                .padding()
                .offset(x: 0, y: initialTextHeight)
                .onTapGesture {
                    showIngredient.toggle()
                }
        }
            Spacer()
        }
        .frame(height: showIngredient ? imageHeight + (CGFloat(cocktail.ingredients.count) * 20) : imageHeight)
        .animation(.easeInOut(duration: 0.3))
        .padding()
    }
}

struct CocktailCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CocktailCell(cocktail: Cocktail.previewCocktail())
                .previewLayout(.fixed(width: 400, height: 400))
            CocktailCell(cocktail: Cocktail.previewCocktail(), showIngredient: true)
                .previewLayout(.fixed(width: 400, height: 600))
        }
    }
}
