//
//  BookDataManager.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

class BookDataWorker: BaseDataWorker {
    override func get(for service: APIService, completion: @escaping Handler) {
        client.get(with: service) { result in
            switch result {
            case .array(let results):
                guard let collection = results as? [[String : Any]],
                let books = self.getBooks(collection) as? [Book] else { return }
                DispatchQueue.main.async {
                    completion(.success(books))
                }
            case .data, .dict: break
            case .error(let reason): completion(.failure(reason))
            }
        }
    }
    
    private func getBooks(_ array: [[String : Any]]) -> [Book] {
        let books = array.map { dict -> Book in
            guard let book = try? jsonEncoder(json: dict, type: Book.self) as? Book else { fatalError("") }
            return book
        }
        return books
    }
}


