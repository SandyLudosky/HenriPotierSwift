//
//  DataManager.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

typealias Handler = (ResultObject<Any>) -> Void
typealias ResultCollectionHandler = (ResultCollection<Any>) -> Void
protocol DataManagerProtocol {
    func get(for service: APIService, completion: @escaping Handler)
}
class BaseDataWorker {
    let client = APIClient<APIService>()
    func get(for service: APIService, completion: @escaping Handler) {
        client.get(with: service) { results in
            switch results {
            case .array, .dict, .data, .error: break
            }
        }
    }
    func jsonEncoder<T: Codable>(json: [String : Any], type: T.Type)  throws -> Any {
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            throw ErrorHandler.invalidData
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
