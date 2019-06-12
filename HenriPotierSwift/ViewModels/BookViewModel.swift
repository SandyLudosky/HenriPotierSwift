//
//  BookViewModel.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

struct BooksViewModel: ViewModelProtocol {
    var isError: Bool
    var message: String?
    var items: [Book]?
}

