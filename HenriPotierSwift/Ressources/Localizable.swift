
//
//  Localizable.swift
//  iOSTechnicalTest
//
//  Created by Sandy on 2019-05-21.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

enum L10n {
    case subTotal
    case discount
    case total
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
extension L10n: CustomStringConvertible {
    var description: String { return self.string }
    
    var string: String {
        switch self {
        case .subTotal: return L10n.tr(key: "subTotal")
        case .discount: return L10n.tr(key: "discount")
        case .total: return L10n.tr(key: "total")
        case .unknown: return L10n.tr(key: "unknown")
        case .invalidData: return L10n.tr(key: "invalidData")
        case .invalidRequest: return L10n.tr(key: "invalidRequest")
        case .encodingError: return L10n.tr(key: "encodingError")
        case .notFound: return L10n.tr(key: "notFound")
        case .itemInvalid: return L10n.tr(key: "itemInvalid")
        case .responsUnsucessful: return L10n.tr(key: "responsUnsucessful")
        case .responseFailure: return L10n.tr(key: "responseFailure")
        case .jsonParsingFailure: return L10n.tr(key: "jsonParsingFailure")
        case .invalidURL: return L10n.tr(key: "invalidURL")
        case .noNetwork: return L10n.tr(key: "noNetwork")
        }
    }
    private static func tr(key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}
func tr(_ key: L10n) -> String {
    return key.string
}

private final class BundleToken {}

