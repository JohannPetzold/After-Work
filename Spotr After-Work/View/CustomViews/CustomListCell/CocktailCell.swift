//
//  CocktailCell.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct CocktailCell: View {
    
    @Binding var cocktail: Cocktail
    @StateObject var cocktailVM: CocktailsViewModel
    @State var showIngredient: Bool = false
    @State var showDetail: Bool = false
    @State var isFavorite: Bool = false
    @State var startAnimation: Bool = false
    
    private let imageHeight: CGFloat = 350
    private let initialTextHeight: CGFloat = 190
    private let corner: CGFloat = 15
    
    var body: some View {
        VStack {
        ZStack(alignment: .top) {
            ZStack {
                CellImage(imageName: $cocktail.name)
                    .frame(height: imageHeight)
                    .cornerRadius(corner)
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                        if isFavorite {
                            RoundedButton(icon: Icon.bookmarkIcon(state: .selected), size: .small, shadow: false) {
                                cocktailVM.deleteCocktailData(cocktail: cocktail) { success in
                                    if success {
                                        isFavorite = false
                                    }
                                }
                            }
                        } else {
                            RoundedButton(icon: Icon.bookmarkIcon(state: .unselected), size: .small, shadow: false) {
                                cocktailVM.saveCocktailData(cocktail: cocktail) { success in
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
            CellText(showIngredient: $showIngredient, cocktail: $cocktail)
                .padding()
                .offset(x: 0, y: initialTextHeight)
                .onTapGesture {
                    showIngredient.toggle()
                }
        }
            Spacer()
        }
        .frame(height: showIngredient ? imageHeight + (CGFloat(cocktail.ingredients.count) * 20) : imageHeight)
        .padding()
        .animation(startAnimation ? .easeInOut(duration: 0.3) : nil)
        .sheet(isPresented: $showDetail, content: {
            DetailCocktailView(cocktail: $cocktail, showDetail: $showDetail, cocktailVM: cocktailVM)
        })
        .onAppear {
            cocktailVM.isCocktailInDatabase(cocktail: cocktail) { isIn in
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
            CocktailCell(cocktail: .constant(Cocktail.previewCocktail()), cocktailVM: CocktailsViewModel())
                .previewLayout(.fixed(width: 400, height: 400))
            CocktailCell(cocktail: .constant(Cocktail.previewCocktail()), cocktailVM: CocktailsViewModel(), showIngredient: true)
                .previewLayout(.fixed(width: 400, height: 600))
        }
    }
}
