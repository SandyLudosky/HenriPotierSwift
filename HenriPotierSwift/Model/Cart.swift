//
//  Cart.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-11.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

struct Cart {
    var selected: [Item] = []
    var items:[Item] = []
    var count:Int {
       return items.count
    }
    init(_ items: [Item]) {
        self.items = items
    }
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
    mutating func update(_ items:[Item]) {
        self.selected = items
        self.items = items
    }
}
