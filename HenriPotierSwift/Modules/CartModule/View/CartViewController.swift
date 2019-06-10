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
    //var presenter: PresenterProtocol?
    //var viewModel = CartViewModel()
    //var dataSource: CartDataSource?
    var books: [Book] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
    }
    override func configureView() {
        //tableView.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: CartCell.identifier)
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: BookCell.identifier)
        //viewModel.getIsbn()
    }
    
    
    override func displayResults() {
        
        
    }
}



