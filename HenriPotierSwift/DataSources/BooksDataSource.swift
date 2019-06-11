//
//  DataSource.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class BooksDataSource: NSObject {
    var items: [Book]
    var selectedBooks = [Book]()
    init(items: [Book]) {
        self.items = items
      
        super.init()
    }
    // MARK: - Helper
    func update(with results: [Book]) {
        items = results
    }
    func result(at indexPath: IndexPath) -> Book {
        return items[indexPath.row]
    }
    
    func select(_ cells: [UITableViewCell],_ tableView: UITableView) {
        selectedBooks = cells.map { cell -> Book? in
            guard let indexPath = tableView.indexPath(for: cell) else { return nil }
            return items[indexPath.row]
            } as! [Book]
    }
}

// MARK: - UITableDataSource
extension BooksDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as? BookCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let book = items[indexPath.row]
        let viewModel = BookCellViewModel(with: book)
        cell.configure(with: viewModel)
        return cell
    }
}

