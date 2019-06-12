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
    var type: Discount = .percentage
    
    init(with cart: CartViewModel) {
        self.cart = cart
    }
    
    var subTotalValueString: String {
        guard let subTotal = self.cart?.subTotal else { return "" }
        return subTotal.format(f: "%.2f",with: "€") 
    }
    var discountValueString: String {
        guard let discount = self.cart?.discount else { return "" }
        return "- \(discount.format(f: "%.2f",with: ""))"
    }
    var totalValueString: String {
        guard let total = self.cart?.total else { return "" }
        return total.format(f: "%.2f",with: "€")
    }
}

