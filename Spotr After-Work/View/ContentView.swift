//
//  ContentView.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cocktailVM = CocktailsViewModel()
    @State var pickerSelection: Int = 1
    @State var displayError: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Cocktails")
                    .font(.system(size: 46))
                    .bold()
                Spacer()
            }
            .padding()
            ListPickerView(selection: $pickerSelection)
                .padding(.horizontal)
            if pickerSelection == 1 {
                CocktailsList(cocktails: $cocktailVM.allCocktails, pickerSelection: $pickerSelection, cocktailVM: cocktailVM)
            } else {
                CocktailsList(cocktails: $cocktailVM.favorites, pickerSelection: $pickerSelection, cocktailVM: cocktailVM)
                    .onAppear {
                        cocktailVM.loadCocktailsData()
                    }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            cocktailVM.loadCocktails { success in
                if !success {
                    displayError = true
                }
            }
            cocktailVM.loadCocktailsData()
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
