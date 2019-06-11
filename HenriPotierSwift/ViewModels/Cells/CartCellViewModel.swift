//
//  CartCellViewModel.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

struct CartCellViewModel {
    var cart: CartViewModel?
    var type: Type = .percentage(value: 0)
    
    init(with cart: CartViewModel) {
        self.cart = cart
    }
    
    var subTotalValueString: String {
        guard let subTotal = self.cart?.subTotal else { return "" }
        return "€\(subTotal)"
    }
    var discountValueString: String {
        guard let discount = self.cart?.discount, let bestRate = self.cart?.best else { return "" }
        return "€\(discount)"
    }
    var totalValueString: String {
        guard let total = self.cart?.total else { return "" }
        return "€\(total)"
    }
}

