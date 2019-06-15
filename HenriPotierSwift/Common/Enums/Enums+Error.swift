//
//  Enums+Error.swift
//  iTunesSearchAPI
//
//  Created by Sandy Ludosky on 23/04/2019.
//  Copyright © 2019 Sandy Ludosky. All rights reserved.
//

import Foundation

public enum StatusCode {
    case clientError, serverError
}
extension StatusCode {
    var string: String {
        switch self {
        case .clientError: return "Client Error"
        case .serverError: return "Server Error"
        }
    }
}
public enum ErrorHandler: Error {
    case unknownError
    case invalidData
    case invalidRequest
    case encodingError
    case itemNotFound
    case itemInvalid
    case responseUnsuccessful
    case responseFailure(StatusCode, statusCode: Int)
    case jsonParsingFailure
    case invalidURL
    case noNetwork
    public var description: String {
        switch self {
        case .unknownError: return NSLocalizedString(L10n.unknown.description, comment: "")
        case .itemNotFound:  return NSLocalizedString(L10n.notFound.description, comment: "")
        case .itemInvalid: return NSLocalizedString(L10n.itemInvalid.description, comment: "")
        case .invalidData: return NSLocalizedString(L10n.invalidData.description, comment: "")
        case .responseUnsuccessful: return NSLocalizedString(L10n.responsUnsucessful.description, comment: "")
        case .responseFailure(let statusCode, let code): return NSLocalizedString("\(statusCode) - status code: \(code)", comment: "")
        case .jsonParsingFailure: return NSLocalizedString(L10n.jsonParsingFailure.description, comment: "")
        case .invalidURL: return NSLocalizedString(L10n.invalidURL.description, comment: "")
        case .encodingError: return NSLocalizedString(L10n.encodingError.description, comment: "")
        case .invalidRequest: return NSLocalizedString(L10n.invalidRequest.description, comment: "")
        case .noNetwork: return NSLocalizedString(L10n.noNetwork.description, comment: "")
        }
    }
}

