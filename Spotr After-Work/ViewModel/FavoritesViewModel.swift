//
//  FavoritesViewModel.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    
    @Published var cocktails = [Cocktail]()
    
    private let coreDataHelper = CoreDataHelper(context: PersistenceController.viewContext)
    
    func saveCocktailData(cocktail: Cocktail, completion: (Bool) -> Void) {
        coreDataHelper.saveCocktail(cocktail: cocktail) { success in
            cocktails.append(cocktail)
            completion(success)
        }
    }
    
    func deleteCocktailData(cocktail: Cocktail, completion: (Bool) -> Void) {
        coreDataHelper.deleteCocktail(cocktail: cocktail) { success in
            cocktails.removeAll { favorite in
                cocktail.id == favorite.id
            }
            completion(success)
        }
    }
    
    func isCocktailInDatabase(cocktail: Cocktail, completion: (Bool) -> Void) {
        coreDataHelper.isInDatabase(cocktail: cocktail) { success in
            completion(success)
        }
    }
    
    func loadCocktailsData() {
        coreDataHelper.getAllCocktails { cocktails in
            self.cocktails = cocktails
        }
    }
}
