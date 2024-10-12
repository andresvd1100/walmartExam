//
//  CommonError.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//
import Foundation
public struct CommonError: Codable {
    
    public var statusCode: Int?
    public var statusMessage: String?
    public var success: Bool?
    
    public init(statusCode: Int? = nil, statusMessage: String? = nil, success: Bool? = nil) {
        self.statusCode = statusCode
        self.statusMessage = statusMessage
        self.success = success
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statusCode = try container.decodeIfPresent(Int.self, forKey: .statusCode)
        self.statusMessage = try container.decodeIfPresent(String.self, forKey: .statusMessage)
        self.success = try container.decodeIfPresent(Bool.self, forKey: .success)
    }
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
