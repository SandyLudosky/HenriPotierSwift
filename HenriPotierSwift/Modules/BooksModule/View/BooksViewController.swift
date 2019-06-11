//
//  ViewController.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-06.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class BooksViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addToCartAction(_ sender: UIBarButtonItem) {
       addToCart()
        guard dataSource.selectedBooks.count > 0 else { return }
       router?.pushToView(with: "goToCart", and: dataSource.selectedBooks)
    }
    var dataSource = BooksDataSource(items: [])
   
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
    }
    
    override func configureView() {
       tableView.dataSource = dataSource
       tableView.delegate = self
       tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: BookCell.identifier)
        
    }
  
    override func displayResults() {
        interactor?.fetch(with: APIServiceRequest(with: .book))
    }
    
    override func success<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol {
        guard let booksViewModel = viewModel as? BooksViewModel,
              let books = booksViewModel.items else { return }
        self.dataSource.update(with: books)
        self.tableView.reloadData()
    }
    
    override func error<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol {
        //prévoir alert dialog
    }
    
    func addToCart() {
        let cells = tableView.visibleCells
        let checkedCells = cells.filter { cell -> Bool in
            cell.accessoryType == .checkmark
        }
        dataSource.select(checkedCells, tableView)
    }
}

//MARK - UITableViewDelegate
extension BooksViewController: UITableViewDelegate  {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? BookCell else { return }
        cell.toggle()
        tableView.reloadData()
    }
}


extension BooksViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCart" {
            guard let cartVC = segue.destination as? CartViewController else { return }
            cartVC.books = dataSource.selectedBooks
        }
    }
}
