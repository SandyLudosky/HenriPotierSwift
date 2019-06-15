//
//  BooksInteractor.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class BooksInteractor: BusinessLogic {
    var presenter: PresentationLogic?
    var worker = BookDataWorker()
    func fetch<Api>(with request: Request<Api>) where Api : APIProtocol {
        guard let apiService = request.service as? APIService else { return }
        worker.get(for: apiService, completion: { results in
            switch results {
            case .success(let objects):
                guard let books = objects as? [Book] else { return }
                self.presenter?.showResults(with: Model.Response(result: books, isError: false, message: nil))
            case .failure(let reason):
                let items = [Book]()
                self.presenter?.showResults(with: Model.Response(result: items, isError: true, message: reason.description))
            }
        })
    }
}
