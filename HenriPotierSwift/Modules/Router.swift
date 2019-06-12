//
//  Router.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

class Router: RoutingLogic {
    var viewVC: BaseViewController?
    func pushToView(with identifier: String, and response: Any) {
        switch identifier {
        case "goToCart": goToCart(with: response, and: identifier)
        default: break
        }
    }
}

extension Router {
    private func goToCart(with response: Any, and identifier: String) {
        viewVC?.performSegue(withIdentifier: identifier, sender: viewVC)
    }
}
