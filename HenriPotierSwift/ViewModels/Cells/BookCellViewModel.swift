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

class BookCellViewModel {
    var coverImage: UIImage?
    var coverImageView: UIImageView?
    var cover: String?
    var title: String?
    var isbn: String?
    var price: String?
    var euros: String?
    
    init(with book: Book) {
        if let bookCover = book.cover {
            self.cover = bookCover
        }
        self.title = book.title
        self.isbn = book.isbn
        guard let price = book.price else { return }
        self.price = Double(price).format(f: "%.2f")
    }
}

