//
//  CocktailsViewModel.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation

class CocktailsViewModel: ObservableObject {
    
    @Published var allCocktails = [Cocktail]()
    @Published var favorites = [Cocktail]()
    
    private let service = APIService()
    private let coreDataHelper = CoreDataHelper(context: PersistenceController.viewContext)
    
    func loadCocktails(completion: (_ success: Bool) -> Void) {
        service.fetchCocktails { newCocktails, error in
            if let cocktails = newCocktails {
                self.allCocktails = cocktails
                completion(true)
            }
            if error != nil {
                completion(false)
            }
        }
    }
    
    func saveCocktailData(cocktail: Cocktail, completion: (Bool) -> Void) {
        coreDataHelper.saveCocktail(cocktail: cocktail) { success in
            favorites.append(cocktail)
            completion(success)
        }
    }
    
    func deleteCocktailData(cocktail: Cocktail, completion: (Bool) -> Void) {
        coreDataHelper.deleteCocktail(cocktail: cocktail) { success in
            favorites.removeAll { favorite in
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
            favorites = cocktails
        }
    }
}
