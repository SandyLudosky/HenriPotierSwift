//
//  BookCell.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

protocol CartValueDelegate {
    func updateCart(_ cell: BookSelectedCell, with qty: Int, and price: Double)
}
class BookSelectedCell: BaseCell {
    static let identifier = "bookSelectedCellIdentifier"
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var cartTitleLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var delegate: CartValueDelegate?
    var price: Double = 0.0
    var quantity: Int = 1 {
        didSet {
            delegate?.updateCart(self, with: quantity, and: price)
            quantityLabel.text = "\(quantity)"
        }
    }
    
    func setUp() {
        stepper.addTarget(self, action: #selector(changeQuantity(_:)), for: .touchUpInside)
    }
    
    @objc func changeQuantity(_ sender: UIStepper) {
        quantity = Int(sender.value)
    }
    
    func configure(with viewModel: BookCellViewModel) {
        setUp()
        self.accessoryType = isChecked ? .checkmark : .none
        self.cartTitleLabel.text = viewModel.title
        setImage(with: viewModel.cover ?? "")
        guard let price = viewModel.price else { return }
        self.cartPriceLabel.text = price
        self.price = viewModel.priceDouble ?? 0.0
        self.tintColor = Color.amethyste
        quantityLabel.text = "\(quantity)"
    }
}

extension BookSelectedCell {
    private func setImage(with cover: String) {
        self.cartImageView?.sd_setImage(with: URL(string: cover)) { (image, error, type, url) in
            if error == nil {
                self.cartImageView.image = image
            }
        }
    }
}

