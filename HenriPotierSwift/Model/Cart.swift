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
    func getISBNs() -> [String] {
        let isbns = books.map { book -> String in
            guard let isbn = book.isbn else { return "" }
            return isbn
        }
        return isbns
    }
}
