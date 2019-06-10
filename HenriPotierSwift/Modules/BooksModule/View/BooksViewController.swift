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
        performSegue(withIdentifier: "goToCart", sender: self)
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
}

//MARK - UITableViewDelegate
extension BooksViewController: UITableViewDelegate  {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? BookCell else { return }
        cell.toggle()
        tableView.reloadData()
    }
}

//MARK - Segue
extension BooksViewController {
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // viewModel.addToCart(dataSource, tableView)
        //guard let cartVC = segue.destination as? CartViewController,
       // let selected = dataSource.selectedBooks as? [Book] else { return }
       // cartVC.viewModel.books = selected
    }
}

