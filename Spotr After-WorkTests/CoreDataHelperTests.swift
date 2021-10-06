//
//  CoreDataHelperTests.swift
//  Spotr After-WorkTests
//
//  Created by Johann Petzold on 06/10/2021.
//

import XCTest
@testable import Spotr_After_Work

class CoreDataHelperTests: XCTestCase {
    
    func testGivenCocktailWhenUsingSaveCocktailThenGettingTrue() {
        let helper = CoreDataHelper(context: CoreDataStackTest().persistentContainer.newBackgroundContext())
        let cocktail = Cocktail.previewCocktail()
        
        helper.saveCocktail(cocktail: cocktail) { success in
            XCTAssertTrue(success)
        }
    }
    
    func testGivenBadContextWhenUsingSaveCocktailThenGettingFalse() {
        let helper = CoreDataHelper(context: CoreDataStackTest().badPersistentContainer.newBackgroundContext())
        let cocktail = Cocktail.previewCocktail()
        
        helper.saveCocktail(cocktail: cocktail) { success in
            XCTAssertFalse(success)
        }
    }
    
    func testGivenCocktailWhenUsingDeleteCocktailThenGettingTrue() {
        let helper = CoreDataHelper(context: CoreDataStackTest().persistentContainer.newBackgroundContext())
        let cocktail = Cocktail.previewCocktail()
        
        helper.saveCocktail(cocktail: cocktail) { success in
            if success {
                helper.deleteCocktail(cocktail: cocktail) { success in
                    XCTAssertTrue(success)
                }
            }
        }
    }
    
    func testGivenBadContextWhenUsingDeleteCocktailThenGettingFalse() {
        let helper = CoreDataHelper(context: CoreDataStackTest().badPersistentContainer.newBackgroundContext())
        let cocktail = Cocktail.previewCocktail()
        
        helper.deleteCocktail(cocktail: cocktail) { success in
            XCTAssertFalse(success)
        }
    }
    
    func testGivenCocktailWhenUsingIsInDatabaseThenGettingTrue() {
        let helper = CoreDataHelper(context: CoreDataStackTest().persistentContainer.newBackgroundContext())
        let cocktail = Cocktail.previewCocktail()
        
        helper.saveCocktail(cocktail: cocktail) { success in
            if success {
                helper.isInDatabase(cocktail: cocktail) { result in
                    XCTAssertTrue(result)
                }
            }
        }
    }
    
    func testGivenOtherCocktailWhenUsingIsInDatabaseThenGettingFalse() {
        let helper = CoreDataHelper(context: CoreDataStackTest().persistentContainer.newBackgroundContext())
        let cocktail = Cocktail.previewCocktail()
        let cocktail2 = Cocktail.previewCocktail2()
        
        helper.saveCocktail(cocktail: cocktail) { success in
            if success {
                helper.isInDatabase(cocktail: cocktail2) { result in
                    XCTAssertFalse(result)
                }
            }
        }
    }
    
    func testGivenBadContextWhenUsingIsInDatabaseThenGettingFalse() {
        let helper = CoreDataHelper(context: CoreDataStackTest().badPersistentContainer.newBackgroundContext())
        let cocktail = Cocktail.previewCocktail()
        
        helper.isInDatabase(cocktail: cocktail) { result in
            XCTAssertFalse(result)
        }
    }
    
    func testGivenCocktailsInDatabaseWhenUsingGetAllCocktailsThenGetAll() {
        let helper = CoreDataHelper(context: CoreDataStackTest().persistentContainer.newBackgroundContext())
        let cocktail = Cocktail.previewCocktail()
        let cocktail2 = Cocktail.previewCocktail2()
        
        helper.saveCocktail(cocktail: cocktail) { success in
            if success {
                helper.saveCocktail(cocktail: cocktail2) { success in
                    if success {
                        helper.getAllCocktails { cocktails in
                            XCTAssertEqual(cocktails[0].id, "11000")
                            XCTAssertEqual(cocktails[1].id, "178354")
                        }
                    }
                }
            }
        }
    }
    
    func testGivenBadContextWhenUsingGetAllCocktailsThenGetEmpty() {
        let helper = CoreDataHelper(context: CoreDataStackTest().badPersistentContainer.newBackgroundContext())
        
        helper.getAllCocktails { cocktails in
            XCTAssertEqual(cocktails.count, 0)
        }
    }
}
