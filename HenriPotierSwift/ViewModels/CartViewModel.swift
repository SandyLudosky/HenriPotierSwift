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
    var computedOffers: [Offer] = [] {
        didSet {
            sorted = sort()
            bestOffer = getBestOffer()
        }
    }
    var sorted: [Offer] = []
    var bestOffer: Offer?
    var offers: [Offer] = []
}

extension CartViewModel {
    init(with books: [Book], isError: Bool) {
        self.isError = isError
        self.message = isError.description
        self.books = books
    }
    
    mutating func calculateCartValue() {
        computedOffers = calculate()
    }

    //SubTotal before discount
    var subTotal: Double {
        let sum: Double = self.books.reduce(0) {
            return $0 + $1.price
        }
        return sum
    }

    //best discount
    var discount: Double {
       guard let value = bestOffer?.value else { return 0.0 }
        if subTotal == 0.0 {
            return 0.0
        }
       return Double(value)
    }
    
    //total after discount
    var total: Double {
        return subTotal - discount
    }
    
    private mutating func calculate() -> [Offer]  {
        let computed = offers.map { offer -> Offer in
            switch offer.discount {
            case .percentage: return offer.calculate(with: subTotal, type: .percentage)
            case .minus: return offer.calculate(with: subTotal, type: .minus)
            case .slice: return offer.calculate(with: subTotal, type: .slice)
            }
        }
        return computed
    }
    
    private mutating func sort() -> [Offer] {
        return computedOffers.sorted()
    }
    
     private func getBestOffer() -> Offer {
        guard let best = sorted.first else { return Offer(type: nil, sliceValue: 0, value: 0, discountValue: 0.0) }
        return best
    }
}


