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


class BookSelectedViewModel: CellViewModel {
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

