//
//  Offer.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

enum Discount {
    case percentage, minus, slice
    var string: String {
        switch self {
        case .percentage: return "percentage"
        case .minus: return "minus"
        case .slice: return "slice"
        }
    }
}

struct Offer: Codable  {
    let type: String?
    var sliceValue:Int = 0
    var value: Int = 0
    var discountValue: Double = 0.0
    var discount: Discount {
        switch self.type {
        case "percentage": return .percentage
        case "minus": return .minus
        case "slice": return .slice
        default: break
        }
        return .percentage
    }
}

//MARK - Codable
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

extension Offer {
    func calculate(with total: Double, type: Discount) -> Offer {
        switch type {
        case .percentage: return percentage(with: total, and: self.value)
        case .minus: return minus(with: total, and: self.value)
        case .slice: return slice(with: total, and: (self.value, self.sliceValue))
        }
    }
}

//MARK - Comparable
extension Offer: Comparable {
    static func < (lhs: Offer, rhs: Offer) -> Bool {
        return lhs.discountValue < rhs.discountValue
    }
}

//MARK - Private
extension Offer {
    private func percentage(with total: Double, and value: Int) -> Offer {
        let discount = total - ((total * Double(value)) / 100)
        return Offer(type: self.type, sliceValue: 0, value: self.value, discountValue: discount)
    }
    private func minus(with total: Double, and value: Int) -> Offer {
        let discount = Double(total - Double(value))
        return Offer(type: self.type, sliceValue: 0, value: self.value, discountValue: discount)
    }
    private func slice(with total: Double, and value: (Int,Int)) -> Offer {
        let times = total / Double(value.0)
        let minus = times * Double(value.1)
        let discount = Double(total - minus)
        return Offer(type: self.type, sliceValue: self.sliceValue, value: self.value, discountValue: discount)
    }
}
