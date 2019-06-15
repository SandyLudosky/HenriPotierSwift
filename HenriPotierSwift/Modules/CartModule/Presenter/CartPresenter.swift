//
//  CartPresenter.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-11.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

class CartPresenter: PresentationLogic {
    var viewVC: DisplayLogic?
    func showResults<Object>(with response: Model.Response<Object>) where Object : Decodable, Object : Encodable {
        guard let offers = response.result as? [Offer] else {
              viewVC?.error(viewModel: CartViewModel(with: [], isError: true))
            return
        }
         var cartVM = CartViewModel(with: [],  isError: false)
         cartVM.offers = offers
         viewVC?.success(viewModel: cartVM)
    }
}
