//
//  ContentView.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cocktailsVM = CocktailsViewModel()
    @StateObject var favoritesVM = FavoritesViewModel()
    @State var pickerSelection: Int = 1
    @State var displayError: Bool = false
    
    private let title = "Cocktails"
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(Font.blackFont(), size: Font.largeTitleSize()))
                    .bold()
                Spacer()
            }
            .padding()
            ListPickerView(selection: $pickerSelection)
                .padding(.horizontal)
            if pickerSelection == 1 {
                CocktailsList(cocktails: $cocktailsVM.cocktails, pickerSelection: $pickerSelection, favoritesVM: favoritesVM)
            } else {
                CocktailsList(cocktails: $favoritesVM.cocktails, pickerSelection: $pickerSelection, favoritesVM: favoritesVM)
                    .onAppear {
                        favoritesVM.loadCocktailsData()
                    }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            cocktailsVM.loadCocktails { success in
                if !success {
                    displayError = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        }
        
    }
}
