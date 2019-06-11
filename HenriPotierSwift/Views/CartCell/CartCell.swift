//
//  CartCell.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class CartCell: BaseCell {
    @IBOutlet weak var subTotalValueLabel: UILabel!
    @IBOutlet weak var discountValueLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var cartCellView: UIView!
    static let identifier = "cartCellIdentifier"
    
    func configureView() {
        cartCellView.layer.cornerRadius = 10.0
        cartCellView.layer.masksToBounds = true
        cartCellView.layer.borderWidth = 1
        cartCellView.layer.borderColor = UIColor.gray.cgColor
    }
   
    func configure(with vm: CartCellViewModel) {
        subTotalValueLabel.text = vm.subTotalValueString
        discountValueLabel.text = vm.discountValueString
        totalValueLabel.text = vm.totalValueString
        configureView()
    }
}
