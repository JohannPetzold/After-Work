//
//  DetailCocktailView.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import SwiftUI
import UIKit

struct DetailCocktailView: View {
    
    @Binding var cocktail: Cocktail
    @Binding var showDetail: Bool
    @StateObject var favoritesVM: FavoritesViewModel
    
    @State var isFavorite: Bool = false
    @State var showIngredient: Bool = false
    @State var showImage: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack {
                    CellImage(imageName: $cocktail.name)
                        .frame(height: geometry.size.height / 2.5)
                        .clipped()
                        .onTapGesture {
                            if UIImage(named: cocktail.name) != nil {
                                showImage = true
                            }
                        }
                    CellText(showIngredient: $showIngredient, cocktail: $cocktail, showDetail: true)
                }
                .disabled(showImage)
                VStack {
                    HStack {
                        RoundedButton(icon: Icon.closeIcon(), size: .small, shadow: false) {
                            showDetail.toggle()
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: UIDevice().hasNotch ? 50 : 15, leading: 15, bottom: 0, trailing: 0))
                    Spacer()
                    HStack {
                        Spacer()
                        if isFavorite {
                            RoundedButton(icon: Icon.bookmarkIcon(state: .selected), size: .medium, shadow: true) {
                                favoritesVM.deleteCocktailData(cocktail: cocktail) { success in
                                    if success {
                                        isFavorite = false
                                    }
                                }
                            }
                        } else {
                            RoundedButton(icon: Icon.bookmarkIcon(state: .unselected), size: .medium, shadow: true) {
                                favoritesVM.saveCocktailData(cocktail: cocktail) { success in
                                    if success {
                                        isFavorite = true
                                    }
                                }
                            }
                        }
                        RoundedButton(icon: Icon.linkIcon(), size: .medium, shadow: true) {
                            if let url = URL(string: cocktail.url) {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
                    .disabled(showImage)
                    .padding(.horizontal)
                    .offset(x: 0, y: 50 / 2)
                }
                .disabled(showImage)
                .frame(height: geometry.size.height / 2.5)
                if showImage {
                    ShowImageView(cocktail: $cocktail, showImage: $showImage)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.4)))
                        .zIndex(1)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .onAppear {
                favoritesVM.isCocktailInDatabase(cocktail: cocktail) { isIn in
                    if isIn {
                        isFavorite = true
                    }
                }
            }
        }
    }
}

struct DetailCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailCocktailView(cocktail: .constant(Cocktail.previewCocktail()), showDetail: .constant(true), favoritesVM: FavoritesViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            DetailCocktailView(cocktail: .constant(Cocktail.previewCocktail()), showDetail: .constant(true), favoritesVM: FavoritesViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
            DetailCocktailView(cocktail: .constant(Cocktail.previewCocktail()), showDetail: .constant(true), favoritesVM: FavoritesViewModel(), showImage: true)
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
        }
    }
}
