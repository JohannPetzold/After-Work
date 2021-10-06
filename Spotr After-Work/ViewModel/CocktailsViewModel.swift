//
//  CocktailsViewModel.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation

class CocktailsViewModel: ObservableObject {
    
    @Published var cocktails = [Cocktail]()
    
    private let service = APIService()
    
    func loadCocktails(completion: (_ success: Bool) -> Void) {
        service.fetchCocktails { newCocktails, error in
            if let cocktails = newCocktails {
                self.cocktails = cocktails
                completion(true)
            }
            if error != nil {
                completion(false)
            }
        }
    }
}
