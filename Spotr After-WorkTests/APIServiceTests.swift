//
//  APIServiceTests.swift
//  Spotr After-WorkTests
//
//  Created by Johann Petzold on 06/10/2021.
//

import XCTest
@testable import Spotr_After_Work

class APIServiceTests: XCTestCase {

    func testWhenUsingFetchCocktailsThenGetCocktails() {
        let service = APIService()
        
        service.fetchCocktails { cocktails, error in
            if let cocktail = cocktails?.first {
                XCTAssertEqual(cocktail.id, "11000")
            }
        }
    }
    
    func testGivenBadFilenameWhenUsingFetchCocktailsThenGetError() {
        let service = APIService(filename: "Wrong")
        
        service.fetchCocktails { cocktails, error in
            XCTAssertEqual(error as! ServiceError, ServiceError.badUrl)
        }
    }

    func testGivenBadDataUrlWhenUsingFetchCocktailsThenGetError() {
        let service = APIService(filename: "Empty")
        
        service.fetchCocktails { cocktails, error in
            XCTAssertEqual(error as! ServiceError, ServiceError.decodeFail)
        }
    }
}
