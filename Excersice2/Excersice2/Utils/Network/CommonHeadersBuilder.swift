//
//  CommonHeadersBuilder.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//
import Foundation

public class CommonHeadersBuilder {
    private var commonHeaders: CommonHeaders
    
    init() {
        self.commonHeaders = CommonHeaders()
    }
    
    public func set(accept: String) -> Self {
        commonHeaders.accept = accept
        return self
    }
    
    public func set(contentType: String) -> Self {
        commonHeaders.contentType = contentType
        return self
    }
    
    public func set(authorization: String) -> Self {
        commonHeaders.authorization = authorization
        return self
    }
    
    public func build() -> CommonHeaders {
        return commonHeaders
    }
    
    
    public static func defaultHeaders() -> CommonHeaders {
        let commonHeaders = CommonHeadersBuilder()
            .set(accept: "application/json")
            .set(contentType: "application/json")
            .build()
        return commonHeaders
    }
    
}


public struct CommonHeaders: Codable {
    var accept: String?
    var contentType: String?
    var authorization: String?
    
    
    enum CodingKeys: String, CodingKey {
        case accept
        case contentType = "content-type"
        case authorization = "Authorization"
    }
    
}
