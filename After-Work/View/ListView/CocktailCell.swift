//
//  CocktailCell.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct CocktailCell: View {
    
    @Binding var cocktail: Cocktail
    @StateObject var cocktailsVM: CocktailsViewModel
    @StateObject var favoritesVM: FavoritesViewModel
    let expandCell: Namespace.ID
    
    @State var showIngredient: Bool = false
    @State var showDetail: Bool = false
    @State var isFavorite: Bool = false
    @State var startAnimation: Bool = false
    
    private let imageHeight: CGFloat = 360
    private let paddingText: CGFloat = 20
    private let initialTextHeight: CGFloat = 200
    
    var body: some View {
        if favoritesVM.animationId != cocktail.id {
            VStack {
                ZStack(alignment: .top) {
                    ZStack {
                        CellImage(cocktail: $cocktail)
                            .matchedGeometryEffect(id: Animations.expandName(.image) + cocktail.id, in: expandCell)
                            .frame(height: imageHeight)
                            .cornerRadius(Corner.defaultCorner())
                        VStack(alignment: .trailing) {
                            HStack {
                                Spacer()
                                if isFavorite {
                                    RoundedButton(icon: .bookmarkSelected, size: .small, shadow: false) {
                                        favoritesVM.deleteCocktailData(cocktail: cocktail) { success in
                                            if success {
                                                isFavorite = false
                                            }
                                        }
                                    }
                                    .matchedGeometryEffect(id: Animations.expandName(.bookmark) + cocktail.id, in: expandCell)
                                } else {
                                    RoundedButton(icon: .bookmarkUnselected, size: .small, shadow: false) {
                                        favoritesVM.saveCocktailData(cocktail: cocktail) { success in
                                            if success {
                                                isFavorite = true
                                            }
                                        }
                                    }
                                    .matchedGeometryEffect(id: Animations.expandName(.bookmark) + cocktail.id, in: expandCell)
                                }
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(height: imageHeight)
                    .onTapGesture {
                        withAnimation(Animations.expandCell()) {
                            favoritesVM.detailCocktail = cocktail
                            favoritesVM.animationId = cocktail.id
                            favoritesVM.displayDetail = true
                        }
                    }
                    VStack {
                        Spacer()
                        CellText(showIngredient: $showIngredient, cocktail: $cocktail)
                            .matchedGeometryEffect(id: Animations.expandName(.text) + cocktail.id, in: expandCell)
                            .padding(paddingText)
                            .offset(x: 0, y: showIngredient ? (CGFloat(cocktail.ingredients.count) * 5) : 0)
                            .onTapGesture {
                                withAnimation(Animations.showIngredient()) {
                                    showIngredient.toggle()
                                }
                            }
                    }
                }
                Spacer()
            }
            .frame(height: showIngredient ? imageHeight + (CGFloat(cocktail.ingredients.count) * 20) : imageHeight)
            .padding()
            .onAppear {
                favoritesVM.isCocktailInDatabase(cocktail: cocktail) { isIn in
                    if isIn {
                        isFavorite = true
                    } else {
                        isFavorite = false
                    }
                }
            }
        } else {
            Rectangle().opacity(0).frame(height: showIngredient ? imageHeight + (CGFloat(cocktail.ingredients.count) * 20) : imageHeight)
        }
    }
}

struct CocktailCell_Previews: PreviewProvider {
    
    @Namespace static var previewId
    
    static var previews: some View {
        Group {
            CocktailCell(cocktail: .constant(Cocktail.previewCocktail()), cocktailsVM: CocktailsViewModel(), favoritesVM: FavoritesViewModel(), expandCell: previewId)
                .previewLayout(.fixed(width: 400, height: 400))
            CocktailCell(cocktail: .constant(Cocktail.previewCocktail()), cocktailsVM: CocktailsViewModel(), favoritesVM: FavoritesViewModel(), expandCell: previewId, showIngredient: true)
                .previewLayout(.fixed(width: 400, height: 600))
        }
    }
}
