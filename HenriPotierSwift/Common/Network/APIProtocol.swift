//
//  APIProtocol.swift
//  iTunesSearchAPI
//
//  Created by Sandy Ludosky on 20/04/2019.
//  Copyright © 2019 Sandy Ludosky. All rights reserved.
//

import Foundation

public protocol APIProtocol {
    var baseURL: String { get }
    var endpoint: String { get } // required
    var path: String? { get }
    var parameters: [Any]? { get }
    var request: URLRequest? { get }
}

extension APIProtocol {
    func asURLRequest(queryItems: [URLQueryItem]) throws -> URLRequest? {
        
        //baseURL + endpoints
        guard let urlStr = URL(string: baseURL),
        var urlComponents = urlStr.appendingPathComponent(endpoint) as? URL
            else { throw ErrorHandler.encodingError }
        
        
        if let params = parameters as? [String] {
            let string = params.joined(separator:",")
            urlComponents = urlComponents.appendingPathComponent(string)
       
        }
        if let path = path {
             urlComponents = urlComponents.appendingPathComponent(path)
        }
        
        // encoded URL
        guard let components = URLComponents(url: urlComponents, resolvingAgainstBaseURL: false),
        let url = components.url,
            let encodedURL = url.encode(),
            let request =  URLRequest(url: encodedURL) as? URLRequest
            else { throw ErrorHandler.invalidRequest }
        
        return request
    }
}
