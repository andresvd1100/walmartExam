//
//  NetworkUtils.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//
import Foundation

extension Encodable {
    public var headers: [String : String]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (
            try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            )
        ).flatMap {
            $0 as? [String : String]
        }
    }
}
