//
//  Rate.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-11.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

struct Rate: Comparable {
    static func == (lhs: Rate, rhs: Rate) -> Bool {
        return lhs.value < rhs.value
    }
    var value: Double = 0.0
    var discount: Int = 0
    var type: Type
    static func < (lhs: Rate, rhs: Rate) -> Bool {
        return lhs.value < rhs.value
    }
}
