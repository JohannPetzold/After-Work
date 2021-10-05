//
//  CocktailJSON.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation

class CocktailsJSON: Decodable {
    var list: [CocktailJSON]
}

class CocktailJSON: Decodable {
    var id: String
    var name: String
    var url: String
    var ingredients: [String]
    var tags: [String]
    var recipe: String
}
