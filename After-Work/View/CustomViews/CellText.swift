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
    
    private let shadowRadius: CGFloat = 10
    private let shadowYOffset: CGFloat = 5
    private let vPadding: CGFloat = 20
    private let hPadding: CGFloat = 20
    private let paddingDetail: CGFloat = 20
    private let ingredientsTitle = "INGREDIENTS"
    private let instructionsTitle = "INSTRUCTIONS"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(cocktail.name)
                    .font(.custom(Font.mediumFont(), size: Font.titleSize()))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .foregroundColor(Colors.primary)
                Spacer()
                if !showDetail {
                    Image(systemName: showIngredient ? Icon.getIconName(.chevronUp) : Icon.getIconName(.chevronDown))
                        .frame(width: Icon.IconName.chevronDown.iconWidth(), height: Icon.IconName.chevronDown.iconHeight())
                        .foregroundColor(Colors.secondary)
                }
            }
            .padding(.bottom, 10)
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
        .background(Color.white)
        .cornerRadius(showDetail ? 0 : Corner.defaultCorner())
        .shadow(color: Colors.primary.opacity(Opacity.shadowOpacity()), radius: showDetail ? 0 : shadowRadius, x: 0, y: showDetail ? 0 : shadowYOffset)
    }
}

struct CellText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Rectangle().foregroundColor(.blue).frame(width: 450, height: 200)
                CellText(showIngredient: .constant(false), cocktail: .constant(Cocktail.previewCocktail3()))
                    .padding(.horizontal, 30)
            }
            .previewLayout(.fixed(width: 480, height: 300))
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
                Rectangle().foregroundColor(.blue).frame(width: 500, height: 600)
                CellText(showIngredient: .constant(false), cocktail: .constant(Cocktail.previewCocktail()), showDetail: true)
                    .padding(.horizontal, 30)
            }
            .previewLayout(.fixed(width: 500, height: 600))
        }
    }
}
