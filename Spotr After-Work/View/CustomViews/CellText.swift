//
//  CellText.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct CellText: View {
    
    @Binding var showIngredient: Bool
    @Binding var cocktail: Cocktail
    
    var showDetail: Bool = false
    
    private let shadowRadius: CGFloat = 5
    private let shadowYOffset: CGFloat = 6
    private let shadowOpacity: CGFloat = 0.3
    private let vPadding: CGFloat = 19
    private let hPadding: CGFloat = 20
    private let paddingDetail: CGFloat = 30
    private let ingredientsTitle = "INGREDIENTS"
    private let instructionsTitle = "INSTRUCTIONS"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(cocktail.name)
                    .font(.custom(Font.primaryFont(), size: Font.detailSize()))
                    .minimumScaleFactor(0.7)
                    .foregroundColor(Colors.text)
                Spacer()
            }
            if !showIngredient || showDetail {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach($cocktail.tags, id: \.self) { tag in
                            TagText(tag: tag)
                        }
                    }
                }
                .padding(.bottom, showDetail ? paddingDetail : 0)
            } else if showIngredient {
                DetailText(title: ingredientsTitle, details: cocktail.ingredients)
            }
            if showDetail {
                ScrollView(.vertical, showsIndicators: false) {
                    DetailText(title: ingredientsTitle, details: cocktail.ingredients)
                        .padding(.bottom, paddingDetail)
                    DetailText(title: instructionsTitle, recipe: cocktail.recipe)
                }
            }
        }
        .padding(EdgeInsets(top: vPadding, leading: hPadding, bottom: vPadding, trailing: hPadding))
        .background(Colors.background)
        .cornerRadius(showDetail ? 0 : Corner.defaultCorner())
        .shadow(color: Color.black.opacity(shadowOpacity), radius: showIngredient ? shadowRadius : 0, x: 0, y: showIngredient ? shadowYOffset : 0)
    }
}

struct CellText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Rectangle().foregroundColor(.blue).frame(width: 450, height: 200)
                CellText(showIngredient: .constant(false), cocktail: .constant(Cocktail.previewCocktail()))
                    .padding(.horizontal, 30)
            }
            .previewLayout(.fixed(width: 480, height: 300))
            ZStack {
                Rectangle().foregroundColor(.blue).frame(width: 450, height: 400)
                CellText(showIngredient: .constant(true), cocktail: .constant(Cocktail.previewCocktail()))
                    .padding(.horizontal, 30)
            }
            .previewLayout(.fixed(width: 480, height: 400))
            ZStack {
                Rectangle().foregroundColor(.blue).frame(width: 450, height: 400)
                CellText(showIngredient: .constant(false), cocktail: .constant(Cocktail.previewCocktail()), showDetail: true)
                    .padding(.horizontal, 30)
            }
            .previewLayout(.fixed(width: 480, height: 500))
        }
    }
}
