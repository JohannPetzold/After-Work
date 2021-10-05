//
//  Cocktail.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation

class Cocktail {
    
    var id: String
    var name: String
    var url: String
    var ingredients: [String]
    var tags: [String]
    var recipe: String
    
    init(id: String = "", name: String = "", url: String = "", ingredients: [String] = [], tags: [String] = [], recipe: String = "") {
        self.id = id
        self.name = name
        self.url = url
        self.ingredients = ingredients
        self.tags = tags
        self.recipe = recipe
    }
    
    init(cocktailJson: CocktailJSON) {
        self.id = cocktailJson.id
        self.name = cocktailJson.name
        self.url = cocktailJson.url
        self.ingredients = cocktailJson.ingredients
        self.tags = cocktailJson.tags
        self.recipe = cocktailJson.recipe
    }
}

extension Cocktail {
    static func previewCocktail() -> Cocktail {
        let cocktail = Cocktail(
            id: "11000",
            name: "Mojito",
            url: "https://www.thecocktaildb.com/drink/11000-Mojito-Cocktail",
            ingredients: ["2-3 oz Light rum", "Juice of 1 lime", "2 tsp Sugar", "2-4 Mint", "Soda water"],
            tags: ["CONTEMPORARYCLASSIC", "VEGAN"],
            recipe: "Muddle mint leaves with sugar and lime juice.\nAdd a splash of soda water and fill the glass with cracked ice.\nPour the rum and top with soda water.\nGarnish and serve with straw.")
        return cocktail
    }
    
    static func previewCocktail2() -> Cocktail {
        let cocktail = Cocktail(
            id: "178354",
            name: "Pink Moon",
            url: "https://www.thecocktaildb.com/drink/178354-Pink-Moon",
            ingredients: ["2-3 oz Light rum", "Juice of 1 lime", "2 tsp Sugar", "2-4 Mint", "Soda water"],
            tags: ["CONTEMPORARYCLASSIC", "VEGAN"],
            recipe: "Muddle mint leaves with sugar and lime juice.\nAdd a splash of soda water and fill the glass with cracked ice.\nPour the rum and top with soda water.\nGarnish and serve with straw.")
        return cocktail
    }
}
