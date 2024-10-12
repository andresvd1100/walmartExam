//
//  ProductEndpoint.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
enum ProductEndpoint: APIEndpoint {
    case retrieveAllProducts
    var baseURL: URL {
        URL(string: APIConstants.baseURL.rawValue)!
    }
    
    var path: String {
        switch self {
        case .retrieveAllProducts:
            return "/products"
        
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .retrieveAllProducts:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .retrieveAllProducts:
            return CommonHeadersBuilder.defaultHeaders().headers
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .retrieveAllProducts:
            return nil
        }
    }
    
    var timeOutInterval: TimeInterval {
        return TimeInterval(10)
    }
    
    var parser: Parserable {
        switch self {
        case .retrieveAllProducts:
            return CommonDecoder()
        }
    }
}


enum ProductError: Error, Equatable {
    case generic
}

