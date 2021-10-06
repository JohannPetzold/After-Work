//
//  CocktailsList.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct CocktailsList: View {
    
    @Binding var cocktails: [Cocktail]
    @Binding var pickerSelection: Int
    @StateObject var favoritesVM: FavoritesViewModel
    
    var body: some View {
        if cocktails.count > 0 {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach($cocktails, id: \.id) { cocktail in
                        CocktailCell(cocktail: cocktail, favoritesVM: favoritesVM)
                    }
                }
                .transition(AnyTransition.scale.animation(.default))
            }
        } else {
            VStack {
                Spacer()
                if pickerSelection == 1 {
                    Text("No Cocktail Found")
                        .font(.custom(Font.primaryFont(), size: Font.titleSize()))
                        .foregroundColor(Colors.text)
                } else if pickerSelection == 2 {
                    VStack {
                        Text("No Favorite Cocktail")
                            .font(.custom(Font.primaryFont(), size: Font.titleSize()))
                            .foregroundColor(Colors.text)
                            .padding(.bottom, 20)
                        Text("Add cocktail to favorites using")
                            .font(.custom(Font.primaryFont(), size: Font.subtitleSize()))
                        RoundedButton(icon: Icon.bookmarkIcon(state: .unselected), size: .medium, shadow: true, action:  { })
                    }
                }
                Spacer()
            }
        }
    }
}

struct CocktailsList_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CocktailsList(cocktails: .constant([]), pickerSelection: .constant(1), favoritesVM: FavoritesViewModel())
            CocktailsList(cocktails: .constant([]), pickerSelection: .constant(2), favoritesVM: FavoritesViewModel())
            CocktailsList(cocktails: .constant([Cocktail.previewCocktail(), Cocktail.previewCocktail2()]), pickerSelection: .constant(2), favoritesVM: FavoritesViewModel())
        }
    }
}
