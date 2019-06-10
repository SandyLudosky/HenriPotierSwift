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
    func pushToView<Object>(with identifier: String, and response: Object) where Object : Decodable, Object : Encodable {
        switch identifier {
        case "goToCart": goToCart(with: response, and: identifier)
        default: break
        }
    }
}

extension Router {
    private func goToCart<O: Codable>(with response: O, and identifier: String) {
        guard let cartVC:CartViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CartViewController") as? CartViewController,
            let books = response as? [Book] else { return }
        cartVC.books = books
        viewVC?.performSegue(withIdentifier: identifier, sender: viewVC)
    }
}
