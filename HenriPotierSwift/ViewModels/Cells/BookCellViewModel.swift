//
//  BookCellViewModel.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class CellViewModel {
    var title: String?
    var price: String?
    var priceDouble: Double?
    init(with item: Item) {
        self.title = item.title
        self.price = Double(item.unitPrice).format(f: "%.2f",with: "€")
        self.priceDouble = item.unitPrice
    }
}
class BookCellViewModel: CellViewModel {
    var coverImage: UIImage?
    var coverImageView: UIImageView?
    var cover: String?
    var isbn: String?
    
    required init(with book: Book) {
        super.init(with: book)
        if let bookCover = book.cover {
            self.cover = bookCover
        }
        self.isbn = book.isbn
    }
}

