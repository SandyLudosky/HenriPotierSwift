//
//  CartViewModel.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

//Cart
struct CartViewModel: ViewModelProtocol {
    var isError: Bool
    var message: String?
    var books: [Book] = []
    var offers: [Offer] = []
    var best: Rate?
}

extension CartViewModel {
    init(with books: [Book], offers: [Offer], isError: Bool) {
        self.isError = isError
        self.message = isError.description
        self.books = books
        self.offers = offers
        self.best = getBestRates()
    }
    
    var commercialOffers:[Offer] {
        guard let offers = offers as? [Offer] else { return [] }
        return offers
    }
    var percentage: Offer {
        return commercialOffers[0]
    }
    var minus: Offer {
        return commercialOffers[1]
    }
    var slice: Offer {
        return commercialOffers[2]
    }
    
    //SubTotal before discount
    var subTotal: Double {
        var sum = 0.0
        books.forEach { book in
            guard let price = book.price else { return }
            sum = sum + Double(price)
        }
        /*
         let sum = self.books.reduce(0) {
         guard let price = $1.price else { return 0 }
         return $0 + price
         }
         */
        return Double(sum)
    }
    
    mutating func getBestRates() -> Rate? {
        var rates: [Rate] = []
        rates.append(calculate(with: .percentage(value: percentage.value)))
        rates.append(calculate(with: .minus(value: minus.value)))
        rates.append(calculate(with: .slice(value: slice.value, value: slice.sliceValue)))
        guard let sorted = rates.sorted() as? [Rate] else { return Rate(value: 0.0, discount: 0, type: .percentage(value: 0)) }
        best = sorted.first
        return sorted.first
    }
    
    //best discount
    var discount: Double {
       guard let value = best?.value else { return 0.0 }
       return value
    }
    
    //total after discount
    var total: Double {
        return subTotal + discount
    }
}

//MARK - Private
extension CartViewModel {
    private func calculate(with type: Type) -> Rate {
        switch type {
        case .percentage(let value): return percentage(with: value)
        case .minus(let value): return minus(with: value)
        case .slice(let sliceValue, let value): return slice(with: (sliceValue, value))
        }
    }
    private func percentage(with value: Int) -> Rate {
        let rate = Rate(value: total - ((total * Double(value)) / 100), discount: value, type: .percentage(value: 0))
        return rate
    }
    private func minus(with value: Int) -> Rate {
        let rate = Rate(value: Double(total - Double(value)), discount: value, type: .minus(value: 0))
        return rate
    }
    private func slice(with value:(Int, Int)) -> Rate {
        guard Double(value.0) > total else { return Rate(value: 0, discount: 0, type: .percentage(value: 0)) }
        let times = total / Double(value.0)
        let minus = times * Double(value.1)
        let rate =  Rate(value: Double(total - minus), discount: value.1, type: .slice(value: value.0, value: value.1))
        return rate
    }
}

