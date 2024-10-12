//
//  CommonDecoder.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//


import Foundation
public final class CommonDecoder: Parserable {
    typealias Decoder = JSONDecoder
    
    public init() {}
    
    public func decode<T>(_ type: T.Type, from output: URLSession.DataTaskPublisher.Output) throws -> T where T : Decodable {
        return try Decoder().decode(type, from: output.data)
    }

}
