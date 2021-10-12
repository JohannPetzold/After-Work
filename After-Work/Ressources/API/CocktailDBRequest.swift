//
//  CocktailDBRequest.swift
//  CocktailDBRequest
//
//  Created by Johann Petzold on 08/10/2021.
//

import Foundation

class CocktailDBRequest {
    
    private static var url = "https://www.thecocktaildb.com/api/json/v1"
    private static var apiKey = "1"
    
    enum RequestType: String {
        case random = "random.php"
        case search = "search.php"
        case lookup = "lookup.php"
    }
    
    static func randomCocktail() -> String {
        let request = url + "/" + apiKey + "/" + RequestType.random.rawValue
        return request
    }
}
