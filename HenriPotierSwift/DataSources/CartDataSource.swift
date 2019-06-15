//
//  CartDataSource.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

protocol CartDelegate {
    func updateCart()
}
class CartDataSource: NSObject {
    var cartVM: CartViewModel?
    var tableView: UITableView!
    var delegate: CartDelegate?
    init(cart: CartViewModel?,_ tableView: UITableView) {
        self.cartVM = cart
        self.tableView = tableView
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookSelectedCell.identifier, for: indexPath) as? BookSelectedCell else { return UITableViewCell() }
            guard let books = cartVM?.books else { return UITableViewCell() }
            let book = books[indexPath.row]
            cell.configure(with: BookCellViewModel(with: book))
            cell.delegate = self
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
}
extension CartDataSource: CartValueDelegate {
    func updateCart(_ cell: BookSelectedCell, with qty: Int, and price: Double) {
        guard let indexPath = tableView.indexPath(for: cell),
              let books = cartVM?.books,
              let book = books[indexPath.row] as? Book else { return }
        book.price = price * Double(qty)
        cartVM?.books.remove(at: indexPath.row)
        cartVM?.books.insert(book, at: indexPath.row)
        delegate?.updateCart()
    }
}

