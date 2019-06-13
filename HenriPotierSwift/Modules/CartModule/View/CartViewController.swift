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
    var cart: Cart?
    var isbns: [String] = []
    var cartVM: CartViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        getIsbn()
        displayResults()
    }
    
    override func setup() {
        let viewController = self
        let presenter = CartPresenter()
        let interactor = CartInteractor()
        let router = Router()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewVC = viewController
        router.viewVC = viewController
    }
    
    override func configureView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: CartCell.identifier)
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: BookCell.identifier)
    }
    
    override func displayResults() {
        interactor?.fetch(with: APIServiceRequest(with: .offers(isbns)))
    }
    
    func getIsbn() {
        guard let booksISBNS = cart?.getISBNs() else { return }
        isbns = booksISBNS
    }
    
    override func success<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol {
        guard var cartViewModel = viewModel as? CartViewModel,
            let selectedBooks = cart?.items as? [Book] else { return }
        cartViewModel.books = selectedBooks
        cartVM = cartViewModel
        self.dataSource.update(with: cartVM)
        self.tableView.reloadData()
    }
    
    override func error<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol {
        if viewModel.isError {
            view.makeToast(message: "\(String(describing: viewModel.message))", duration: HRToastDefaultDuration, position: .bottom)
        }
    }
}
extension CartViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let DeleteAction = UITableViewRowAction(style: .default, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            self.deleteAction(at: indexPath)
        })
        return [DeleteAction]
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
}

//MARK -Navigation
extension CartViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

//MARK - Private
extension CartViewController {
    private func deleteAction(at indexPath: IndexPath) {
        guard var vm = self.cartVM,
              var books = self.cart?.items as? [Book],
              let title = books[indexPath.row].title else { return }
        books.remove(at: indexPath.row)
        self.cart?.update(books)
        vm.books = books
        self.dataSource.update(with: vm)
        self.tableView.reloadData()
        self.view.makeToast(message: "item \(title.format(with: .bold)) removed", duration: HRToastDefaultDuration, position: .bottom)  
    }
}
