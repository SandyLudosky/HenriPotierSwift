//
//  BookViewModel.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

struct BookViewModel: ViewModelProtocol {
    var isError: ErrorHandler
    var message: String
    let isbn: String?
    let title: String?
    let price: Int?
    let cover: String?
    let synopsis: [String]?
    var bestRate: Double?
}


extension BookViewModel {
    
}

