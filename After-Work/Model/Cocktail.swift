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
    var url: String = ""
    var ingredients: [String] = []
    var tags: [String] = []
    var recipe: String
    
    init(id: String = "", name: String = "", url: String = "", ingredients: [String] = [], tags: [String] = [], recipe: String = "") {
        self.id = id
        self.name = name
        self.url = url
        self.ingredients = ingredients
        self.tags = tags
        self.recipe = recipe
    }
    
    // Init from JSON
    init(cocktailJson: CocktailJSON) {
        self.id = cocktailJson.id
        self.name = cocktailJson.name
        self.url = cocktailJson.url
        self.ingredients = cocktailJson.ingredients
        self.tags = cocktailJson.tags
        self.recipe = cocktailJson.recipe
    }
    
    // Init from CoreData
    init(favoriteCocktail: FavoriteCocktail) {
        self.id = favoriteCocktail.id ?? ""
        self.name = favoriteCocktail.name ?? ""
        self.url = favoriteCocktail.url ?? ""
        if let favoriteIngredients = favoriteCocktail.ingredients {
            if let newIngredients = try? JSONDecoder().decode([String].self, from: favoriteIngredients) {
                self.ingredients = newIngredients
            }
        }
        if let favoriteTags = favoriteCocktail.tags {
            if let newTags = try? JSONDecoder().decode([String].self, from: favoriteTags) {
                self.tags = newTags
            }
        }
        self.recipe = favoriteCocktail.recipe ?? ""
    }
    
    //Init from API
    init(drink: Drink) {
        self.id = drink.idDrink
        self.name = drink.strDrink
        self.recipe = drink.strInstructions
        self.url = getCocktailUrl(id: drink.idDrink, name: drink.strDrink)
        self.ingredients = getCocktailIngredients(from: drink)
        self.tags = getCocktailTags(tags: drink.strTags)
    }
}

// Init from API
extension Cocktail {
    
    private func getCocktailUrl(id: String, name: String) -> String {
        var url = "https://www.thecocktaildb.com/drink/"
        url += id + "-" + name.lowercased().replacingOccurrences(of: " ", with: "-")
        return url
    }
    
    private func getCocktailIngredients(from drink: Drink) -> [String] {
        var ingredients = [String]()
        var ingredient: String = ""
        if let ing = drink.strIngredient1 {
            if let meas = drink.strMeasure1 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient2 {
            if let meas = drink.strMeasure2 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient3 {
            if let meas = drink.strMeasure3 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient4 {
            if let meas = drink.strMeasure4 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient5 {
            if let meas = drink.strMeasure5 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient6 {
            if let meas = drink.strMeasure6 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient7 {
            if let meas = drink.strMeasure7 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient8 {
            if let meas = drink.strMeasure8 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient9 {
            if let meas = drink.strMeasure9 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient10 {
            if let meas = drink.strMeasure10 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient11 {
            if let meas = drink.strMeasure11 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient12 {
            if let meas = drink.strMeasure12 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient13 {
            if let meas = drink.strMeasure13 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient14 {
            if let meas = drink.strMeasure14 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        if let ing = drink.strIngredient15 {
            if let meas = drink.strMeasure15 {
                ingredient = meas.getProperMeasure()
            }
            ingredient += ing
            ingredients.append(ingredient)
        }
        return ingredients
    }
    
    private func getCocktailTags(tags: String?) -> [String] {
        guard let tags = tags else { return [] }
        let result = tags.components(separatedBy: ",")
        return result
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
