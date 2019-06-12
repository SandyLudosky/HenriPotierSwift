//
//  Cart.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-11.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

struct Cart {
    var items:[Item] = []
    var count = 0
    func getISBNs() -> [String] {
        guard let books = items as? [Book] else { return []}
        let isbns = books.map { book -> String in
            guard let isbn = book.isbn else { return "" }
            return isbn
        }
        return isbns
    }
    
    mutating func add(_ items:[Item]) {
        self.items = items
    }
    
    init(_ items: [Item]) {
        self.items = items
    }
}
