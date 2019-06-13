//
//  DataSource.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class ItemsDataSource: NSObject {
    var items: [Item]
    var selectedBooks = [Item]()
    init(items: [Item]) {
        self.items = items
        
        super.init()
    }
    // MARK: - Helper
    func update(with results: [Item]) {
        items = results
    }
    func result(at indexPath: IndexPath) -> Item {
        return items[indexPath.row]
    }
    
    func select(_ cells: [UITableViewCell],_ tableView: UITableView) -> [Item] {
        selectedBooks = cells.map { cell -> Item? in
            guard let indexPath = tableView.indexPath(for: cell) else { return nil }
            return items[indexPath.row]
            } as! [Item]
        return selectedBooks
    }
    
    func updateSelection(_ items: [Item],_ cells: [UITableViewCell]) {
        for (item, cell) in zip(items, cells) {
            if let book = item as? Book, let bookCell = cell as? BookCell {
                bookCell.unCheck()
                print("\(book.isbn) \(bookCell.isbnLabel.text )")
                if book.isbn == bookCell.isbnLabel.text {
                    bookCell.toggle()
                }
            }
        }
    }
}

// MARK: - UITableDataSource
extension ItemsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as? BookCell else { return UITableViewCell() }
        if let book = items[indexPath.row] as? Book {
            let viewModel = BookCellViewModel(with: book)
            cell.configure(with: viewModel)
        }
        return cell
    }
}

