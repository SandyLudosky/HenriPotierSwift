//
//  BaseViewController.swift
//  HenriPotierLibrary
//
//  Created by Sandy on 2019-06-09.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var interactor: BusinessLogic?
    override func viewDidLoad() {
        configureView()
        setup()
    }
    
    func setup() {
        let viewController = self
        let presenter = BooksPresenter()
        let interactor = BooksInteractor()
        viewController.interactor = interactor
        presenter.viewVC = viewController
    }
    func configureView() {}
    func displayResults() {}
}


extension BaseViewController: DisplayLogic {
    func success<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol { }
    func error<viewModel>(viewModel: viewModel) where viewModel : ViewModelProtocol {}
}
