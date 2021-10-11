//
//  NetworkSession.swift
//  NetworkSession
//
//  Created by Johann Petzold on 08/10/2021.
//

import Foundation

protocol NetworkSession {
    func loadUrlData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    
    func loadUrlData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }
}
