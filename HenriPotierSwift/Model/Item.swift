//
//  Item.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-12.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

class Item {
    var title: String?
    var unitPrice: Double = 0.0
    var price: Double = 0.0 // to compute with quantity if > 1
    
    init(title: String, unitPrice: Double) {
        self.title = title
        self.unitPrice = unitPrice
        self.price = price == 0.0 ? self.unitPrice : price
    }
}

