//
//  Protocols.swift
//  LoginCoordinator
//
//  Created by Sandy on 2019-05-18.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelProtocol {
    var isError : ErrorHandler { get set }
    var message: String { get set }
}
protocol DisplayLogic: class {
    var interactor: BusinessLogic? { get set }
    func success<viewModel: ViewModelProtocol>(viewModel: viewModel)
    func error<viewModel: ViewModelProtocol>(viewModel: viewModel)
}

protocol BusinessLogic: class {
    var presenter: PresentationLogic? { get set }
    func fetch<Api: APIProtocol>(request: Model.Request<Api>)
}

protocol PresentationLogic {
    func presentResults<Object: Codable>(response: Model.Response<Object>)
}





