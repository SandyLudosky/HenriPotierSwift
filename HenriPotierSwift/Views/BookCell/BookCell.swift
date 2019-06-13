//
//  BookCell.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class BookCell: BaseCell {
    static let identifier = "bookCellIdentifier"
    var isChecked = false
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func toggle() {
        isChecked = !isChecked
    }
    
    func unCheck() {
        isChecked = false
    }
    
    func configure(with viewModel: BookCellViewModel) {
        self.accessoryType = isChecked ? .checkmark : .none
        //self.coverImageView.image = viewModel.coverImage
        self.titleLabel.text = viewModel.title
        self.isbnLabel.text = viewModel.isbn
        guard let price = viewModel.price else { return }
        self.priceLabel.text = price
        setImage(with: viewModel.cover ?? "")
        self.tintColor = .green
    }
}

extension BookCell {
    private func setImage(with cover: String) {
        self.coverImageView?.sd_setImage(with: URL(string: cover)) { (image, error, type, url) in
            if error == nil {
                self.coverImageView.image = image
            }
        }
    }
}

