//
//  APIService.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation

class APIService {
    
    private var filename = "Cocktail"
    
    init(filename: String = "Cocktail") {
        self.filename = filename
    }
    
    func fetchCocktails(completion: ([Cocktail]?, Error?) -> Void) {
        let bundle = Bundle(for: APIService.self)
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            completion(nil, ServiceError.badUrl)
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            completion(nil, ServiceError.noData)
            return
        }
        guard let cocktailsJson = try? JSONDecoder().decode(CocktailsJSON.self, from: data) else {
            completion(nil, ServiceError.decodeFail)
            return
        }
        let cocktails = convertFromJson(cocktailsJson)
        completion(cocktails, nil)
    }
    
    private func convertFromJson(_ cocktailsJson: CocktailsJSON) -> [Cocktail] {
        var cocktails = [Cocktail]()
        for cocktailJson in cocktailsJson.list {
            cocktails.append(Cocktail(cocktailJson: cocktailJson))
        }
        return cocktails
    }
}
