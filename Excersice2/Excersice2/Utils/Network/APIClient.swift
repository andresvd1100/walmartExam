//
//  ApiClient.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func perform<T: Decodable, K: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<Response<T>, APIError<K>>
}
