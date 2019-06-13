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
    var cart = Cart([])
    let button = UIButton(type: .system)
    @IBAction func addToCartAction(_ sender: UIBarButtonItem) {
       
    }
    var dataSource = ItemsDataSource(items: [])
   
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //update tableView with books in cart
         button.setTitle("\(cart.count) ", for: .normal)
    }
    
    override func configureView() {
       tableView.dataSource = dataSource
       tableView.delegate = self
       tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: BookCell.identifier)
       configureCartButton()
    }
    
    func configureCartButton() {
        button.setTitle("\(cart.count) ", for: .normal)
        button.setImage(UIImage(named: "shopping-cart"), for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(navigateToCart), for: .touchUpInside)
        let rightButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func navigateToCart() {
        addToCart()
        router?.pushToView(with: "goToCart", and: cart as Any)
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
        if viewModel.isError {
            view.makeToast(message: "\(String(describing: viewModel.message))", duration: HRToastDefaultDuration, position: .bottom)
        }
    }
}

//MARK - UITableViewDelegate
extension BooksViewController: UITableViewDelegate  {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? BookCell else { return }
        cell.toggle()
        tableView.reloadData()
        let count = getSelectedCells().count
        button.setTitle("\(count)", for: .normal)
    }
}

//MARK -Navigation
extension BooksViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCart" {
            guard let cartVC = segue.destination as? CartViewController else { return }
            cartVC.cart = cart
        }
    }
    
    @IBAction func unwindFromCartVC(_ sender: UIStoryboardSegue) {
        guard let source = sender.source as? CartViewController, let cart = source.cart else { return }
        self.cart = cart
        self.dataSource.updateSelection(cart.selected, tableView.visibleCells)
        tableView.reloadData()
    }
}

//MARK - Private
extension BooksViewController {
    private func addToCart() {
        let books = dataSource.select(getSelectedCells(), tableView)
        cart.add(books)
    }
    
    // to count selected cells
    private func getSelectedCells() -> [UITableViewCell] {
        let cells = tableView.visibleCells
        let checkedCells = cells.filter { cell -> Bool in
            cell.accessoryType == .checkmark
        }
        return checkedCells
    }
}
