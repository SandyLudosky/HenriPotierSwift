//
//  CartButton.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-14.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class CartButton: UIButton {
    func configure(with image: UIImage, count: Int, color: UIColor) {
        self.setTitle("\(count) ", for: .normal)
        self.setTitleColor(color, for: .normal)
        self.tintColor = color
        self.titleLabel?.textColor = color
        self.setImage(image, for: .normal)
        self.sizeToFit()
    }
}

