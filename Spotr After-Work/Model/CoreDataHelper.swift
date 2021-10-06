//
//  CoreDataHelper.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveCocktail(cocktail: Cocktail, completion: (_ success: Bool) -> Void){
        let favorite = FavoriteCocktail(context: context)
        favorite.initFromCocktail(cocktail: cocktail)
        do {
            try context.save()
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
    
    func deleteCocktail(cocktail: Cocktail, completion: (_ success: Bool) -> Void){
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FavoriteCocktail")
        request.predicate = NSPredicate(format: "id == %@", cocktail.id)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try context.execute(deleteRequest)
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
    
    func isInDatabase(cocktail: Cocktail, completion: (_ result: Bool) -> Void) {
        let request: NSFetchRequest<FavoriteCocktail> = FavoriteCocktail.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", cocktail.id)
        guard let result = try? context.fetch(request) else {
            completion(false)
            return
        }
        if result.first?.id == cocktail.id {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func getAllCocktails(completion: (_ cocktails: [Cocktail]) -> Void) {
        let request: NSFetchRequest<FavoriteCocktail> = FavoriteCocktail.fetchRequest()
        guard let favorites = try? context.fetch(request) else {
            completion([])
            return
        }
        var cocktails = [Cocktail]()
        for favorite in favorites {
            cocktails.append(Cocktail(favoriteCocktail: favorite))
        }
        completion(cocktails)
    }
}
