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
    let expandCell: Namespace.ID
    
    var body: some View {
        if cocktails.count > 0 {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach($cocktails, id: \.id) { cocktail in
                        CocktailCell(cocktail: cocktail, favoritesVM: favoritesVM, expandCell: expandCell)
                    }
                }
            }
//            .transition(Transitions.showCell())
        } else {
            VStack {
                Spacer()
                if pickerSelection == 1 {
                    Text("No cocktail found")
                        .font(.custom(Font.boldFont(), size: Font.titleSize()))
                        .foregroundColor(Colors.primary)
                        
                } else if pickerSelection == 2 {
                    VStack {
                        Text("No favorite cocktail")
                            .font(.custom(Font.boldFont(), size: Font.titleSize()))
                            .foregroundColor(Colors.primary)
                            .padding(.bottom, 20)
                        Text("Add cocktail to favorites using")
                            .font(.custom(Font.regularFont(), size: Font.subtitleSize()))
                        RoundedButton(icon: .bookmarkUnselected, size: .medium, shadow: true, action:  { })
                            .disabled(true)
                    }
                }
                Spacer()
            }
        }
    }
}

struct CocktailsList_Previews: PreviewProvider {
    
    @Namespace static var previewId
    
    static var previews: some View {
        Group {
            CocktailsList(cocktails: .constant([]), pickerSelection: .constant(1), favoritesVM: FavoritesViewModel(), expandCell: previewId)
            CocktailsList(cocktails: .constant([]), pickerSelection: .constant(2), favoritesVM: FavoritesViewModel(), expandCell: previewId)
            CocktailsList(cocktails: .constant([Cocktail.previewCocktail(), Cocktail.previewCocktail2()]), pickerSelection: .constant(2), favoritesVM: FavoritesViewModel(), expandCell: previewId)
        }
    }
}
