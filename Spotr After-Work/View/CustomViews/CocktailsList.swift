//
//  CocktailsList.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct CocktailsList: View {
    
    @Binding var cocktails: [Cocktail]
    
    var body: some View {
        if cocktails.count > 0 {
            VStack {
                ScrollView(.vertical) {
                    ForEach(cocktails, id: \.id) { cocktail in
                        CocktailCell(cocktail: cocktail)
                    }
                }
            }
        } else {
            VStack {
                Spacer()
                HStack {
                    Text("No Cocktail Found")
                        .font(.title)
                        .bold()
                }
                Spacer()
            }
        }
    }
}

struct CocktailsList_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CocktailsList(cocktails: .constant([]))
            CocktailsList(cocktails: .constant([Cocktail.previewCocktail(), Cocktail.previewCocktail2()]))
        }
    }
}
