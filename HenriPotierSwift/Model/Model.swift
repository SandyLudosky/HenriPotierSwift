//
//  Model.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation


struct Model {
    struct Request<Api: APIProtocol> {
        var service : Api
    }
    struct Response<Object: Codable> {
        var result: Object
        var isError: Bool
        var message: String?
    }
}





