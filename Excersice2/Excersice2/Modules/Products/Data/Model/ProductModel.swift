//
//  ProductModel.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation

struct ProductModel: Codable {
    public var id: Int?
    public var title: String?
    public var price: Double?
    public var description: String?
    public var category: String?
    public var image: String?
    public var rating: Rating?
    
}

struct Rating: Codable {
    public var rate: Double?
    public var count: Int?
}
