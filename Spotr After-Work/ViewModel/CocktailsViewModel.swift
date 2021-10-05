//
//  CocktailsViewModel.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation

class CocktailsViewModel: ObservableObject {
    
    @Published var allCocktails = [Cocktail]()
    
    let service = APIService()
    
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
}
