//
//  ErrorsEnum.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import Foundation

enum ServiceError: Error {
    case badUrl
    case noData
    case decodeFail
}
