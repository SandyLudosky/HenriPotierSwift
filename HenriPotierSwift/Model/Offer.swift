//
//  Offer.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

enum Type {
    case percentage(value: Int), minus(value: Int), slice(value: Int,value:  Int)
    var string: String {
        switch self {
        case .percentage: return "percentage"
        case .minus: return "minus"
        case .slice: return "slice"
        }
    }
}

struct CommercialOffer {
    var percentage: Int
    var minus: Int
    var slice: (Int, Int)
}

struct Offer: Codable  {
    let type: String
    let sliceValue:Int
    let value: Int
}

extension Offer {
    enum CodingKeys: String, CodingKey {
        case type, sliceValue, value
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
        sliceValue = try values.decodeIfPresent(Int.self, forKey: .sliceValue) ?? 0
        value = try values.decodeIfPresent(Int.self, forKey: .value) ?? 0
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(sliceValue, forKey: .sliceValue)
        try container.encode(value, forKey: .value)
    }
}
