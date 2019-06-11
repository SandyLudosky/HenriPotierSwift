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
    var cart: CartViewModel?
    init(cart: CartViewModel?) {
        self.cart = cart
        super.init()
    }
    
    // MARK: - Helper
    func update(with cart: CartViewModel?) {
        self.cart = cart
    }
}

// MARK: - UITableDataSource
extension CartDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? cart?.books.count ?? 0 :  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as? BookCell else { return UITableViewCell() }
            guard let books = cart?.books else { return UITableViewCell() }
            let book = books[indexPath.row]
            let viewModel = BookCellViewModel(with: book)
            cell.configure(with: viewModel)
            return cell
        }
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as? CartCell else { return UITableViewCell() }
            guard let value = cart?.rates.first?.value,
                let type = cart?.rates.first?.type else { return UITableViewCell() }
            let viewModel = CartCellViewModel(value: value, type: type)
            cell.configure(with: viewModel)
            return cell
        }
        return UITableViewCell()
    }
}
