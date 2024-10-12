//
//  ManagerAPIClient.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//

import Foundation
import Combine


class ManagerAPIClient<EndpointType: APIEndpoint>: APIClient {
    
    func perform<T, K>(_ endpoint: EndpointType) -> AnyPublisher<Response<T>, APIError<K>> where T : Decodable, K : Decodable, K : Encodable {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach({ request.addValue($0.value, forHTTPHeaderField: $0.key)})
        print("\(String(describing: endpoint.headers))")
        print("\(String(describing: request))")
        let urlSession = URLSession(configuration: .default)
        let cancellable: AnyPublisher<Response<T>, APIError<K>>
        cancellable = urlSession.dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                print(result.data)
                print("===========Decodig....========")
                print(String(decoding: result.data, as: UTF8.self))
                let value = try endpoint.parser.decode(T.self, from: result)
                return Response(value: value, response: result.response)
            }
            .mapError { error in
                print(error)
                if let apiError = error as? APIError<K> {
                    return apiError
                } else if error is URLError {
                    return APIError.invalidResponse
                } else {
                    return APIError.invalidResponse
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        return cancellable
    }
    

    
    
    
    
}
