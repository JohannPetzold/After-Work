//
//  APIService.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation

class APIService {
    
    private var filename = "Cocktail"
    private var session: NetworkSession = URLSession.shared
    
    init(filename: String = "Cocktail", session: NetworkSession = URLSession.shared) {
        self.filename = filename
        self.session = session
    }
    
    // Get cocktails from JSON file
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
    
    func fetchRandomCocktail(completion: @escaping (Cocktail?, Error?) -> Void) {
        guard let url = URL(string: CocktailDBRequest.randomCocktail()) else {
            return
        }
        session.loadUrlData(from: url) { data, _, _ in
            guard let data = data else {
                completion(nil, ServiceError.noData)
                return
            }
            guard let cocktailJson = try? JSONDecoder().decode(CocktailDBJSON.self, from: data) else {
                completion(nil, ServiceError.decodeFail)
                return
            }
            guard let cocktail = self.convertDbCocktailFromJson(cocktailJson) else {
                completion(nil, ServiceError.creationFail)
                return
            }
            completion(cocktail, nil)
        }
    }
    
    private func convertDbCocktailFromJson(_ cocktailJson: CocktailDBJSON) -> Cocktail? {
        guard let newCocktail = cocktailJson.drinks.first else { return nil }
        let cocktail = Cocktail(drink: newCocktail)
        return cocktail
    }
}

enum ServiceError: Error {
    case badUrl
    case noData
    case decodeFail
    case creationFail
}
