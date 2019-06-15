//
//  AnotherAPIService.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-14.
//  Copyright © 2019 Sandy. All rights reserved.
//

import Foundation

public enum AnotherAPIService: APIProtocol {
    public var baseURL: String {
        return ""
    }
    public var endpoint: String {
        return ""
    }
    public var path: String? {
        return nil
    }
    public var parameters: [Any]? {
        return nil
    }
    public var request: URLRequest? {
        return nil
    }
}
