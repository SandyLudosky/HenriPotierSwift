//
//  Model.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

class Request<Api: APIProtocol> {
    let service : Api
    init(with service: Api) {
        self.service = service
    }
}
struct Model {
    struct Response<Object: Codable> {
        let result: Object?
        let isError: Bool
        let message: String?
    }
}

class APIServiceRequest: Request<APIService> {}
class AnotherAPIServiceRequest: Request<AnotherAPIService> {}






