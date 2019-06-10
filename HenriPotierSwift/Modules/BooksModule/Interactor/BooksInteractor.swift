//
//  BooksInteractor.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation


class BooksInteractor: BusinessLogic {
    var presenter: PresentationLogic?
    
    func fetch<Api>(request: Model.Request<Api>) where Api : APIProtocol {
        
    }
}
