//
//  ImageLoader.swift
//  ImageLoader
//
//  Created by Johann Petzold on 11/10/2021.
//

import Foundation
import SwiftUI

class ImageLoaderService: ObservableObject {
    
    @Published var image: UIImage = UIImage()
    
    private let dataHelper = DataHelper()
    
    func loadCocktailImage(cocktail: Cocktail) {
        if let cocktailImage = cocktail.image {
            image = UIImage(data: cocktailImage)!
        } else {
            if cocktail.imageUrl != "" {
                dataHelper.loadDataFromUrl(urlString: cocktail.imageUrl) { data in
                    cocktail.image = data
                    if let data = data {
                        DispatchQueue.main.async {
                            self.image = UIImage(data: data)!
                        }
                    }
                }
            } else {
                let randomImage = getRandomImage()
                if let image = UIImage(data: randomImage) {
                    self.image = image
                    cocktail.image = randomImage
                }
            }
        }
    }
    
    private func getRandomImage() -> Data {
        guard let image = UIImage(named: "Mojito") else { return Data() }
        guard let data = image.jpegData(compressionQuality: 1) else { return Data() }
        return data
    }
}
