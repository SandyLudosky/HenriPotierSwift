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
        guard let object = response.result as? [Offer],
              let offers = object as? [Offer] else {
              viewVC?.error(viewModel: CartViewModel(with: [], offers: [], isError: true))
            return
        }
         viewVC?.success(viewModel: CartViewModel(with: [], offers: offers, isError: false))
    }
}
