//
//  Extensions.swift
//  iTunesSearchAPI
//
//  Created by Sandy Ludosky on 22/04/2019.
//  Copyright © 2019 Sandy Ludosky. All rights reserved.
//

import Foundation
import UIKit

enum FontType {
    case italic, bold, italicBold
}
extension URL {
    func encode() -> URL? {
        let stringURL = self.absoluteString
        let allowedCharacterSet = (CharacterSet(charactersIn: "%").inverted)
        guard let encodedString = stringURL.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) else {
            return nil
        }
        guard let encodedURL = URL(string: encodedString) else {
            return nil
        }
        return encodedURL
    }
}
extension Sequence {
    func transform<T: Codable>(_ type: T.Type) -> Any {
        let results = try? self.map({ dict -> Any in
            guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {
                throw ErrorHandler.invalidData
            }
            return try JSONDecoder().decode(T.self, from: data)
        })
        return results ?? []
    }
}
extension Double {
    func format(f: String, with currency: String) -> String {
        return String(format: "\(currency)\(f)", self)
    }
}
extension String {
    func format(f: String, with currency: String) -> String {
        return String(format: "\(currency)\(f)", self)
    }
    func format(with type: FontType) -> String {
        let font = UIFont(name: "Avenir", size: 14.0)!
        let italicsFont = UIFont(name: "Avenir-BookOblique", size: 14.0)!
        let boldFont = UIFont(name: "Avenir-Heavy", size: 14.0)!
        let boldItalicsFont = UIFont(name: "Avenir-HeavyOblique", size: 14.0)!
        let attributedString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font : font])
        switch type {
        case .italic: attributedString.addAttribute(NSAttributedString.Key.font, value: italicsFont, range: NSMakeRange(12, 7))
        case .bold:  attributedString.addAttribute(NSAttributedString.Key.font, value: boldFont, range: NSMakeRange(7, 4))
        case .italicBold: attributedString.addAttribute(NSAttributedString.Key.font, value: boldItalicsFont, range: NSMakeRange(20, 11))
        }
        return attributedString.string
    }
    func trim() -> String {
        return self.replacingOccurrences(of: "\"", with: "", options: NSString.CompareOptions.literal, range:nil)
    }
}
extension Array where Element:BaseCell {
    func uncheck() {
        self.forEach { cell in
           cell.unCheck()
        }
    }
}
