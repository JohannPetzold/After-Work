//
//  FavoriteCocktail.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation
import CoreData

class FavoriteCocktail: NSManagedObject {
    
    // Init with Cocktail data
    func initFromCocktail(cocktail: Cocktail) {
        self.id = cocktail.id
        self.name = cocktail.name
        self.url = cocktail.url
        self.imageUrl = cocktail.imageUrl
        self.image = cocktail.image
        self.ingredients = cocktail.ingredients.description.data(using: String.Encoding.utf16)
        self.tags = cocktail.tags.description.data(using: String.Encoding.utf16)
        self.recipe = cocktail.recipe
    }
}
