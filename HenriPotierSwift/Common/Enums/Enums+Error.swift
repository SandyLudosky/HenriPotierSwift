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
        case .unknownError: return NSLocalizedString(L10n.Error.unknown.description, comment: "")
        case .itemNotFound:  return NSLocalizedString(L10n.Error.notFound.description, comment: "")
        case .itemInvalid: return NSLocalizedString(L10n.Error.itemInvalid.description, comment: "")
        case .invalidData: return NSLocalizedString(L10n.Error.invalidData.description, comment: "")
        case .responseUnsuccessful: return NSLocalizedString(L10n.Error.responsUnsucessful.description, comment: "")
        case .responseFailure(let statusCode, let code): return NSLocalizedString("\(statusCode) - status code: \(code)", comment: "")
        case .jsonParsingFailure: return NSLocalizedString(L10n.Error.jsonParsingFailure.description, comment: "")
        case .invalidURL: return NSLocalizedString(L10n.Error.invalidURL.description, comment: "")
        case .encodingError: return NSLocalizedString(L10n.Error.encodingError.description, comment: "")
        case .invalidRequest: return NSLocalizedString(L10n.Error.invalidRequest.description, comment: "")
        case .noNetwork: return NSLocalizedString(L10n.Error.noNetwork.description, comment: "")
        }
    }
}

