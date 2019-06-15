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
    func updateSelection(_ items: [Book],_ cells: [BookCell], tableView: UITableView) {
        cells.uncheck()
        self.items.forEach { item1 in
            items.forEach({ item2 in
                let text1 = item1.title?.trim()
                let text2 = item2.title?.trim()
                if text1 == text2 {
                    let index = self.items.firstIndex(where: { item -> Bool in
                        item.title == item2.title
                    })
                    let indexPath = IndexPath(item: index ?? 0, section: 0)
                    cells.forEach { cell in
                        let cell = tableView.cellForRow(at: indexPath) as? BookCell
                        cell?.toggle()
                        
                    }
                }
            })
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

