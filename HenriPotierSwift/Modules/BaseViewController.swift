//
//  BaseViewController.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, DisplayLogic {
    var router: RoutingLogic?
    var interactor: BusinessLogic?
    override func viewDidLoad() {
        configureView()
        setup()
    }
    
    func setup() {
        booksModuleSetup()
        //cartModuleSetup()
    }

    func configureView() {}
    func displayResults() {}
    func success<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol { }
    func error<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol {}
}

extension BaseViewController {
    private func booksModuleSetup() {
        let viewController = self
        let presenter = BooksPresenter()
        let interactor = BooksInteractor()
        let router = Router()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewVC = viewController
        router.viewVC = viewController
    }
    
    private func cartModuleSetup() {
      
        let presenter = CartPresenter()
        let interactor = CartInteractor()
        let router = Router()
      
        interactor.presenter = presenter
       
    }
}

