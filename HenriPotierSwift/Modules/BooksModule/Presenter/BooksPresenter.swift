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
    func presentResults<Object>(response: Model.Response<Object>) where Object : Decodable, Object : Encodable {
        
    }
}
