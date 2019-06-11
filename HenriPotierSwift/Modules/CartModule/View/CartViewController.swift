//
//  OffersViewController.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-08.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class CartViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataSource = CartDataSource(cart: nil)
    var books: [Book]?
    var isbns: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getIsbn()
        displayResults()
    }

    override func configureView() {
        tableView.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: CartCell.identifier)
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: BookCell.identifier)
       
    }

    override func displayResults() {
        interactor?.fetch(with: APIServiceRequest(with: .offers(isbns)))
    }
    
    func getIsbn() {
        books?.forEach { book in
            guard let isbn = book.isbn else { return }
            isbns.append(isbn)
        }
    }
    
    override func success<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol {
        guard var cartViewModel = viewModel as? CartViewModel,
              let b = books else { return }
        cartViewModel.books = b
        self.dataSource.update(with: cartViewModel)
        self.tableView.reloadData()
    }
    
    override func error<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol {
        //prévoir alert dialog
    }
}



