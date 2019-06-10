//
//  File.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

struct Book: Codable  {
    let isbn: String?
    let title: String?
    let price: Int?
    let cover: String?
    let synopsis: [String]?
    var bestRate: Double?
}

extension Book {
    enum CodingKeys: String, CodingKey {
        case isbn,title, price, cover, synopsis
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isbn = try values.decodeIfPresent(String.self, forKey: .isbn) ?? ""
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        price = try values.decodeIfPresent(Int.self, forKey: .price) ?? 0
        cover = try values.decodeIfPresent(String.self, forKey: .cover) ?? ""
        synopsis = try values.decodeIfPresent([String].self, forKey: .synopsis) ?? []
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
