//
//  APIService.swift
//  iTunesSearchAPI
//
//  Created by Sandy Ludosky on 20/04/2019.
//  Copyright © 2019 Sandy Ludosky. All rights reserved.
//

import Foundation

public enum APIService: APIProtocol {
    case book
    case offers([String])
    case download(String)
    
    public var baseURL: String {
        switch self {
        case .book, .offers, .download: return "http://henri-potier.xebia.fr"
        }
    }
   
    public var endpoint: String {
        switch self {
        case .book, .offers: return "books"
        case .download(let endpoint): return endpoint
        }
    }
    
    public var path: String? {
        switch self {
        case .book, .download: return nil
        case .offers: return "commercialOffers"
        }
    }

    public var parameters: [Any]? {
        switch self {
        case .book, .download: return nil
        case .offers(let isbn): return isbn //return isbns of books selected
        }
    }
}

extension APIService {
    public var request: URLRequest? {
        let queryItems = [URLQueryItem]()
        guard let urlRequest = try? asURLRequest(queryItems: queryItems) else {
            return nil
        }
        return urlRequest
    }
}
