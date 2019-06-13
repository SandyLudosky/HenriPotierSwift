//
//  Model.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

class Request<Api: APIProtocol> {
    var service : Api
    
    init(with service: Api) {
        self.service = service
    }
}

class APIServiceRequest: Request<APIService> {}
struct Model {
    struct Response<Object: Codable> {
        var result: Object?
        var isError: Bool
        var message: String?
    }
}





