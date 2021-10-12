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
    @StateObject var cocktailsVM: CocktailsViewModel
    @StateObject var favoritesVM: FavoritesViewModel
    let expandCell: Namespace.ID
    
    var showLoadMore: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        if cocktails.count > 0 {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach($cocktails, id: \.id) { cocktail in
                        CocktailCell(cocktail: cocktail, cocktailsVM: cocktailsVM, favoritesVM: favoritesVM, expandCell: expandCell)
                            .onAppear {
                                if cocktail.wrappedValue.id == cocktails.last!.id && showLoadMore {
                                    isLoading = true
                                    cocktailsVM.loadCocktails { success in
                                        isLoading = false
                                        if !success {
                                            // ERROR
                                        }
                                    }
                                }
                            }
                    }
                    if isLoading {
                        ProgressView()
                            .padding(.bottom, 20)
                    }
                }
            }
        } else {
            VStack {
                Spacer()
                if pickerSelection == 1 && !isLoading {
                    Text("No cocktail found")
                        .font(.custom(Font.boldFont(), size: Font.titleSize()))
                        .foregroundColor(Colors.primary)
                        
                } else if pickerSelection == 2 && !isLoading {
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
                } else {
                    ProgressView()
                }
                Spacer()
            }
            .onAppear {
                if pickerSelection == 1 {
                    isLoading = true
                    cocktailsVM.loadCocktails { success in
                        isLoading = false
                    }
                } else if pickerSelection == 2 {
                    favoritesVM.loadCocktailsData()
                }
            }
        }
    }
}

struct CocktailsList_Previews: PreviewProvider {
    
    @Namespace static var previewId
    
    static var previews: some View {
        Group {
            CocktailsList(cocktails: .constant([]), pickerSelection: .constant(1), cocktailsVM: CocktailsViewModel(), favoritesVM: FavoritesViewModel(), expandCell: previewId)
            CocktailsList(cocktails: .constant([]), pickerSelection: .constant(2), cocktailsVM: CocktailsViewModel(), favoritesVM: FavoritesViewModel(), expandCell: previewId)
            CocktailsList(cocktails: .constant([Cocktail.previewCocktail(), Cocktail.previewCocktail2()]), pickerSelection: .constant(2), cocktailsVM: CocktailsViewModel(), favoritesVM: FavoritesViewModel(), expandCell: previewId)
        }
    }
}
