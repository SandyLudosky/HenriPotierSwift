//
//  CartCell.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var cartCellView: UIView!
    static let identifier = "cartCellIdentifier"
    
    func configureView() {
        cartCellView.layer.cornerRadius = 10.0
        cartCellView.layer.masksToBounds = true
        cartCellView.layer.borderWidth = 1
        cartCellView.layer.borderColor = UIColor.gray.cgColor
    }
   
    func configure(with viewModel: CartCellViewModel) {
        rateLabel.text = "\(viewModel.value)"
        valueLabel.text = viewModel.type.string
        configureView()
    }
}
