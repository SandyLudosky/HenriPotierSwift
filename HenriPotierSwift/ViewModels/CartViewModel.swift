//
//  CartViewModel.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation


struct CartViewModel: ViewModelProtocol {
    var isError: ErrorHandler
    var message: String
    var books:[Book] = []
    var offers:[Offer] = []
    var discount: Double = 0.0
    var subTotal: Double = 0.0
    var total: Double = 0.0
}

extension CartViewModel {
    
    
}
