//
//  BaseCell.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-11.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    var isChecked = false
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func toggle() {
        isChecked.toggle()
    }
    
    func unCheck() {
        isChecked = false
    }
}
