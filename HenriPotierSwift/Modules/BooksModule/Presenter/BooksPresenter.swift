//
//  BooksPresenter.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

class BooksPresenter: PresentationLogic {
    var viewVC: DisplayLogic?
    func showResults<Object>(with response: Model.Response<Object>) where Object : Decodable, Object : Encodable {
        guard let object = response.result as? [Book] else {
            let booksViewModel = BooksViewModel(isError: true, message: response.isError.description, items: nil)
            viewVC?.error(viewModel: booksViewModel)
            return
        }
        let booksViewModel = BooksViewModel(isError: false, message: nil, items: object)
        viewVC?.success(viewModel: booksViewModel)
    }
}
