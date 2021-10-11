//
//  Persistence.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import Foundation
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Cocktails")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static var viewContext: NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
}
