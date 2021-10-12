//
//  CocktailsViewModel.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation
import UIKit

class CocktailsViewModel: ObservableObject {
    
    @Published var cocktails = [Cocktail]()
    
    private let service = APIService()
    
//    func loadCocktails(completion: (_ success: Bool) -> Void) {
//        service.fetchCocktails { newCocktails, error in
//            if let cocktails = newCocktails {
//                self.cocktails = cocktails
//                completion(true)
//            }
//            if error != nil {
//                completion(false)
//            }
//        }
//    }
    
    func loadCocktails(completion: @escaping (_ success: Bool) -> Void) {
        for i in 0...3 {
            service.fetchRandomCocktail { cocktail, error in
                if let cocktail = cocktail {
                    if !self.cocktails.contains(where: { arrayCocktail in
                        cocktail.id == arrayCocktail.id
                    }) {
                        DispatchQueue.main.async {
                            self.cocktails.append(cocktail)
                        }
                    }
                }
                if i == 3 {
                    if error != nil {
                        completion(false)
                    } else {
                        completion(true)
                    }
                }
            }
        }
    }
    
//    func loadCocktailImage(cocktail: Cocktail, completion: @escaping (_ data: Data?) -> Void) {
//    func loadCocktailImage(cocktail: Cocktail) {
//        if let image = cocktail.image {
//            completion(image)
//        } else {
//            if cocktail.imageUrl != "" {
//                dataHelper.loadDataFromUrl(urlString: cocktail.imageUrl) { data in
//                    cocktail.image = data
//                    print("Image loaded")
//                    completion(data)
//                }
//            } else {
//                let randomImage = getRandomImage()
//                cocktail.image = randomImage
////                completion(randomImage)
//            }
//        }
//    }
}
