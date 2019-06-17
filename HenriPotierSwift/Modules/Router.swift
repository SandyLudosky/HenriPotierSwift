//
//  Router.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation
import UIKit

enum SegueIdentifier {
    case cart
    var string : String {
        switch self {
        case .cart: return "goToCart"
        }
    }
   
}
class Router: RoutingLogic {
    var viewVC: BaseViewController?
    func pushToView(with identifier: SegueIdentifier, and response: Any) {
        switch identifier {
        case .cart: goToCart(with: response, and: identifier.string)
        }
    }
}
extension Router {
    private func goToCart(with response: Any, and identifier: String) {
        viewVC?.performSegue(withIdentifier: identifier, sender: viewVC)
    }
}
