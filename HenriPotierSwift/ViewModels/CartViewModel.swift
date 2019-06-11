//
//  CartViewModel.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation


struct CartViewModel: ViewModelProtocol {
    var isError: Bool
    var message: String?
    var books:[Book] = []
    var offers:[Offer] = [] {
        didSet {
            getTotal()
            getBestRate()
        }
        willSet(newValue) {}
    }
    var rates:[Rate] = []
    var discount: Double = 0.0
    var subTotal: Double = 0.0
    var total: Double = 0.0
   
}

extension CartViewModel {
    init(isError: Bool, message: String?, offers: [Offer]) {
        self.isError = isError
        self.message = message
        self.offers = offers
    }
    var commercialOffers:[Offer] {
        guard let offers = offers as? [Offer] else { return [] }
        return offers
    }
    
    var percentage: Int {
        return commercialOffers[0].value
    }
    
    var minus: Int {
        return commercialOffers[1].value
    }
    
    var slice: (Int, Int) {
        return (commercialOffers[2].sliceValue, commercialOffers[2].value)
    }

    mutating func getTotal()  {
        total = books.reduce(0) {(result, next) -> Double in
            guard let price = next.price else { return 0.0 }
            return result + Double(price)
            }
        print("=== total ===")
        print(total)
    }
    
    mutating func getBestRate() {
        print("=== best rates ===")
        rates.append(calculate(with: .percentage(value: percentage)))
        rates.append(calculate(with: .minus(value: minus)))
        rates.append(calculate(with: .slice(value: slice.0, value: slice.1)))
        rates = rates.sorted()
        print("=== sorted ===")
        print(rates.first?.value as Any)
    }
    
    func calculate(with type: Type) -> Rate {
        switch type {
        case .percentage(let value): return percentage(with: value)
        case .minus(let value): return minus(with: value)
        case .slice(let sliceValue, let value): return slice(with: (sliceValue, value))
            
        }
    }
    
    private func percentage(with value: Int) -> Rate {
        let rate = Rate(value: Double(total - ((total * Double(value)) / 100)), type: .percentage(value: 0))
        return rate
    }
    
    private func minus(with value: Int) -> Rate {
        let rate = Rate(value: Double(total - Double(value)), type: .minus(value: 0))
        return rate
    }
    
    private func slice(with value:(Int, Int)) -> Rate {
        guard Double(value.0) > total else { return Rate(value: 0, type: .percentage(value: 0)) }
        let times = total / Double(value.0)
        let minus = times * Double(value.1)
        let rate =  Rate(value: Double(total - minus), type: .slice(value: 0, value: 0))
        return rate
    }
}
