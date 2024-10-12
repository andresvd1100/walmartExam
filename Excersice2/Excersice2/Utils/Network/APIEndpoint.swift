//
//  APIEndpoint.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//

import Foundation
import Combine

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var timeOutInterval: TimeInterval { get }
    var parser: Parserable { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum APIError<K: Codable>: Error {
    case invalidResponse
    case invalidData
    case parser(String)
}

enum APIResult<T: Codable, K: Codable> {
    case success(T)
    case error(APIError<K>)
}

enum ErrorJSONDecoder: LocalizedError {
    case parseError
}

extension ErrorJSONDecoder {
    public var errorDescription: String? {
        switch self {
        case .parseError:
            return NSLocalizedString("Error at decoder object json", comment: "The object cant be decoded")
        }
    }
}


public protocol Parserable {
    func decode<T>(_ type: T.Type, from output: URLSession.DataTaskPublisher.Output) throws -> T where T: Decodable
}

public struct Response<T> {
    public let value: T
    public let response: URLResponse
    
    public init(value: T, response: URLResponse) {
        self.value = value
        self.response = response
    }
}
