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
    var isError : Bool { get set }
    var message: String? { get set }
}
protocol DisplayLogic: class {
    var interactor: BusinessLogic? { get set }
    var router: RoutingLogic? { get set }
    func success<viewModel: ViewModelProtocol>(viewModel: viewModel)
    func error<viewModel: ViewModelProtocol>(viewModel: viewModel)
}
protocol BusinessLogic: class {
    var presenter: PresentationLogic? { get set }
    func fetch<Api: APIProtocol>(with request: Request<Api>)
}
protocol PresentationLogic {
    var viewVC: DisplayLogic? { get set }
    func showResults<Object: Codable>(with response: Model.Response<Object>)
}
protocol RoutingLogic {
    var viewVC: BaseViewController? { get set }
    func pushToView(with identifier: String, and response: Any)
}


