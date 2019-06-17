//
//  CartCell.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class CartCell: BaseCell {
    static let identifier = "cartCellIdentifier"
    @IBOutlet weak var subTotalValueLabel: UILabel!
    @IBOutlet weak var discountValueLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var cartCellView: UIView!
    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var total: UILabel!
    func configureView() {
        cartCellView.layer.cornerRadius = 10.0
        cartCellView.layer.masksToBounds = true
        cartCellView.layer.borderWidth = 1
        cartCellView.layer.borderColor = UIColor.gray.cgColor
        subTotal.text = L10n.Cart.subTotal.description
        discount.text = L10n.Cart.discount.description
        total.text = L10n.Cart.total.description
    }
    func configure(with vm: CartCellViewModel) {
        subTotalValueLabel.text = vm.subTotalValueString
        discountValueLabel.text = vm.discountValueString
        totalValueLabel.text = vm.totalValueString
        configureView()
    }
}
