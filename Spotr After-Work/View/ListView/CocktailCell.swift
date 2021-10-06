//
//  CocktailCell.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct CocktailCell: View {
    
    @Binding var cocktail: Cocktail
    @StateObject var favoritesVM: FavoritesViewModel
    
    @State var showIngredient: Bool = false
    @State var showDetail: Bool = false
    @State var isFavorite: Bool = false
    @State var startAnimation: Bool = false
    
    private let imageHeight: CGFloat = 359
    private let initialTextHeight: CGFloat = 199
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ZStack {
                    CellImage(imageName: $cocktail.name)
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
                            } else {
                                RoundedButton(icon: .bookmarkUnselected, size: .small, shadow: false) {
                                    favoritesVM.saveCocktailData(cocktail: cocktail) { success in
                                        if success {
                                            isFavorite = true
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding()
                }
                .frame(height: imageHeight)
                .onTapGesture {
                    showDetail.toggle()
                }
                VStack {
                    Spacer()
                    CellText(showIngredient: $showIngredient, cocktail: $cocktail)
                        .padding(20)
                        .offset(x: 0, y: showIngredient ? (CGFloat(cocktail.ingredients.count) * 5) : 0)
                        .onTapGesture {
                            showIngredient.toggle()
                        }
                }
                
            }
            Spacer()
        }
        .frame(height: showIngredient ? imageHeight + (CGFloat(cocktail.ingredients.count) * 20) : imageHeight)
        .padding()
        .animation(startAnimation ? .easeInOut(duration: 0.3) : nil)
        .fullScreenCover(isPresented: $showDetail, content: {
            DetailCocktailView(cocktail: $cocktail, showDetail: $showDetail, favoritesVM: favoritesVM)
        })
        .onAppear {
            favoritesVM.isCocktailInDatabase(cocktail: cocktail) { isIn in
                if isIn {
                    isFavorite = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    startAnimation = true
                }
            }
        }
    }
}

struct CocktailCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CocktailCell(cocktail: .constant(Cocktail.previewCocktail()), favoritesVM: FavoritesViewModel())
                .previewLayout(.fixed(width: 400, height: 400))
            CocktailCell(cocktail: .constant(Cocktail.previewCocktail()), favoritesVM: FavoritesViewModel(), showIngredient: true)
                .previewLayout(.fixed(width: 400, height: 600))
        }
    }
}
