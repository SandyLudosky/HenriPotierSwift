//
//  CartInteratoc.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-11.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation


class CartInteractor: BusinessLogic {
    var presenter: PresentationLogic?
    var worker = CartDataWorker()
    func fetch<Api>(with request: Request<Api>) where Api : APIProtocol {
        guard let apiService = request.service as? APIService else { return }
        worker.get(for: apiService, completion: { results in
            switch results {
            case .success(let objects):
                guard let offers = objects as? [Offer] else { return }
                self.presenter?.showResults(with: Model.Response(result: offers, isError: false, message: nil))
            case .failure(let reason):
                let items = [Offer]() // REFACTO !!!!
                self.presenter?.showResults(with: Model.Response(result: items, isError: true, message: reason.description))
            }
        })
    }
}
