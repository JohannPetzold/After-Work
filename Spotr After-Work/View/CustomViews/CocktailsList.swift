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
    @StateObject var cocktailVM: CocktailsViewModel
    
    var body: some View {
        if cocktails.count > 0 {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach($cocktails, id: \.id) { cocktail in
                        CocktailCell(cocktail: cocktail, cocktailVM: cocktailVM)
                    }
                }
            }
        } else {
            VStack {
                Spacer()
                if pickerSelection == 1 {
                    Text("No Cocktail Found")
                        .font(.title)
                        .bold()
                        .foregroundColor(Colors.text)
                } else if pickerSelection == 2 {
                    VStack {
                        Text("No Favorite Cocktail")
                            .font(.title)
                            .bold()
                            .foregroundColor(Colors.text)
                            .padding(.bottom, 20)
                        Text("Add cocktail to favorite using")
                            .font(.title3)
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
            CocktailsList(cocktails: .constant([]), pickerSelection: .constant(1), cocktailVM: CocktailsViewModel())
            CocktailsList(cocktails: .constant([]), pickerSelection: .constant(2), cocktailVM: CocktailsViewModel())
            CocktailsList(cocktails: .constant([Cocktail.previewCocktail(), Cocktail.previewCocktail2()]), pickerSelection: .constant(2), cocktailVM: CocktailsViewModel())
        }
    }
}
