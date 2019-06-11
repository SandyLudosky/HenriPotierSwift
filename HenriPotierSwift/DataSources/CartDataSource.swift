//
//  CartDataSource.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class CartDataSource: NSObject {
    var cartVM: CartViewModel?
    init(cart: CartViewModel?) {
        self.cartVM = cart
        super.init()
    }
    // MARK: - Helper
    func update(with cart: CartViewModel?) {
        self.cartVM = cart
    }
}

// MARK: - UITableDataSource
extension CartDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? cartVM?.books.count ?? 0 :  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as? BookCell else { return UITableViewCell() }
            guard let books = cartVM?.books else { return UITableViewCell() }
            let book = books[indexPath.row]
            cell.configure(with: BookCellViewModel(with: book))
            return cell
        }
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as? CartCell else { return UITableViewCell() }
            guard let cart = cartVM else { return UITableViewCell()  }
            cell.configure(with: CartCellViewModel(with: cart))
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 100 : 130
    }
}
