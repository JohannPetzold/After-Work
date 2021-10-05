//
//  CellText.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct CellText: View {
    
    @Binding var showIngredient: Bool
    var cocktail: Cocktail
    
    private let corner: CGFloat = 15
    private let shadowRadius: CGFloat = 8
    private let shadowYOffset: CGFloat = 6
    private let vPadding: CGFloat = 20
    private let hPadding: CGFloat = 20
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(cocktail.name)
                    .font(.title)
                    .minimumScaleFactor(0.7)
                Spacer()
            }
            if !showIngredient {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(cocktail.tags, id: \.self) { tag in
                            TagText(tag: tag)
                        }
                    }
                }
            } else {
                VStack(alignment: .leading) {
                    Text("INGREDIENTS")
                        .foregroundColor(Colors.primary)
                        .bold()
                    Divider().frame(height: 2).background(Color.black)
                    ForEach(cocktail.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
            }
        }
        .padding(EdgeInsets(top: vPadding, leading: hPadding, bottom: vPadding, trailing: hPadding))
        .background(Colors.background)
        .cornerRadius(corner)
        .shadow(color: Colors.cellShadow, radius: showIngredient ? shadowRadius : 0, x: 0, y: showIngredient ? shadowYOffset : 0)
    }
}

struct CellText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Rectangle().foregroundColor(.blue).frame(width: 450, height: 200)
                CellText(showIngredient: .constant(false), cocktail: Cocktail.previewCocktail())
                    .padding(.horizontal, 30)
            }
            .previewLayout(.fixed(width: 480, height: 300))
            ZStack {
                Rectangle().foregroundColor(.blue).frame(width: 450, height: 400)
                CellText(showIngredient: .constant(true), cocktail: Cocktail.previewCocktail())
                    .padding(.horizontal, 30)
            }
            .previewLayout(.fixed(width: 480, height: 400))
        }
    }
}
