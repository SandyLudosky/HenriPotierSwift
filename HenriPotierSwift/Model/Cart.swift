//
//  Cart.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-11.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation


struct Cart: Codable {
    var books:[Book] = []
    var offers:[Offer]?
    var offer: Offer?
}
