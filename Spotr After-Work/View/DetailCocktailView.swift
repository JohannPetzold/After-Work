//
//  DetailCocktailView.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import SwiftUI

struct DetailCocktailView: View {
    
    @Binding var cocktail: Cocktail
    @Binding var showDetail: Bool
    @StateObject var cocktailVM: CocktailsViewModel
    
    @State var isFavorite: Bool = false
    @State var showIngredient: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack {
                    CellImage(imageName: $cocktail.name)
                        .frame(height: geometry.size.height / 2.5)
                        .clipped()
                        .onTapGesture {
                            showDetail.toggle()
                        }
                    CellText(showIngredient: $showIngredient, cocktail: $cocktail, showDetail: true)
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        if isFavorite {
                            RoundedButton(icon: Icon.bookmarkIcon(state: .selected), size: .medium, shadow: true) {
                                cocktailVM.deleteCocktailData(cocktail: cocktail) { success in
                                    if success {
                                        isFavorite = false
                                    }
                                }
                            }
                        } else {
                            RoundedButton(icon: Icon.bookmarkIcon(state: .unselected), size: .medium, shadow: true) {
                                cocktailVM.saveCocktailData(cocktail: cocktail) { success in
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
                    .padding(.horizontal)
                    .offset(x: 0, y: 50 / 2)
                }
                .frame(height: geometry.size.height / 2.5)
            }
            .edgesIgnoringSafeArea(.top)
            .onAppear {
                cocktailVM.isCocktailInDatabase(cocktail: cocktail) { isIn in
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
            DetailCocktailView(cocktail: .constant(Cocktail.previewCocktail()), showDetail: .constant(true), cocktailVM: CocktailsViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            DetailCocktailView(cocktail: .constant(Cocktail.previewCocktail()), showDetail: .constant(true), cocktailVM: CocktailsViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        }
    }
}
