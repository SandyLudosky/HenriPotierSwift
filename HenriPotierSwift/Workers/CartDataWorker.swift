//
//  CartDataWorker.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-11.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

class CartDataWorker: BaseDataWorker {
    override func get(for service: APIService, completion: @escaping Handler) {
        client.get(with: service) { result in
            switch result {
            case .dict(let dict):
                let offers = self.getOffers(dict)
                DispatchQueue.main.async {
                    completion(.success(offers))
                }
            case .data, .array: break
            case .error(let reason): completion(.failure(reason))
            }
        }
    }
    
    private func getOffers(_ dict: [String : Any]) -> [Offer] {
        guard let array = dict["offers"] as? [[String : Any]] else { return [] }
        let offers = array.map { dict -> Offer in
            guard let offer = try? jsonEncoder(json: dict, type: Offer.self) as? Offer else { fatalError("") }
            return offer
        }
        return offers
    }
}

