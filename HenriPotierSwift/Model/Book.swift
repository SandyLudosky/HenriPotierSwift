//
//  File.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

class Book: Item, Codable {
    let isbn: String?
    let cover: String?
    let synopsis: [String]?
    var bestRate: Double?
    
    enum CodingKeys: String, CodingKey {
        case isbn,title, price, cover, synopsis
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        let price = try values.decodeIfPresent(Int.self, forKey: .price) ?? 0
        isbn = try values.decodeIfPresent(String.self, forKey: .isbn) ?? ""
        cover = try values.decodeIfPresent(String.self, forKey: .cover) ?? ""
        synopsis = try values.decodeIfPresent([String].self, forKey: .synopsis) ?? []
        super.init(title: title, price: price)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(isbn, forKey: .isbn)
        try container.encode(title, forKey: .title)
        try container.encode(price, forKey: .price)
        try container.encode(cover, forKey: .cover)
        try container.encode(synopsis, forKey: .synopsis)
    }
}
