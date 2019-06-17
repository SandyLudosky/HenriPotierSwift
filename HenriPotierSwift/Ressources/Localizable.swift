
//
//  Localizable.swift
//  iOSTechnicalTest
//
//  Created by Sandy on 2019-05-21.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

enum L10n {
    enum Cart {
        case subTotal
        case discount
        case total
    }
    enum Error {
        case unknown
        case invalidData
        case invalidRequest
        case encodingError
        case notFound
        case itemInvalid
        case responsUnsucessful
        case responseFailure
        case jsonParsingFailure
        case invalidURL
        case noNetwork
    }
}
private final class BundleToken {}

extension L10n.Cart: CustomStringConvertible {
    var description: String {
        switch self {
        case .subTotal: return L10n.Cart.tr(key: "subTotal")
        case .discount: return L10n.Cart.tr(key: "discount")
        case .total: return L10n.Cart.tr(key: "total")
            
        }
    }
    private static func tr(key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
    func tr(_ key: L10n.Cart) -> String {
        return key.description
    }
}

extension L10n.Error: CustomStringConvertible {
    var description: String {
        switch self {
        case .unknown: return L10n.Error.tr(key: "unknown")
        case .invalidData: return L10n.Error.tr(key: "invalidData")
        case .invalidRequest: return L10n.Error.tr(key: "invalidRequest")
        case .encodingError: return L10n.Error.tr(key: "encodingError")
        case .notFound: return L10n.Error.tr(key: "notFound")
        case .itemInvalid: return L10n.Error.tr(key: "itemInvalid")
        case .responsUnsucessful: return L10n.Error.tr(key: "responsUnsucessful")
        case .responseFailure: return L10n.Error.tr(key: "responseFailure")
        case .jsonParsingFailure: return L10n.Error.tr(key: "jsonParsingFailure")
        case .invalidURL: return L10n.Error.tr(key: "invalidURL")
        case .noNetwork: return L10n.Error.tr(key: "noNetwork")
        }
    }
    private static func tr(key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
    func tr(_ key: L10n.Error) -> String {
        return key.description
    }
}




