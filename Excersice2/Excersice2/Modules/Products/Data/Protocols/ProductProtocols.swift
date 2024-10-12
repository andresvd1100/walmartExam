//
//  ProductProtocols.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
import Combine

protocol ProductRepositoryProtocol {
    func retrieveProductList() -> AnyPublisher<[ProductModel], Error>
    func retrieveLocalProductList() -> AnyPublisher<[Product], Error>
    func saveAllProducts(products: [ProductDTO]) -> AnyPublisher<Bool, Error>
}

protocol ProductDataManagerProtocol {
    func retrieveProductList() -> AnyPublisher<[ProductModel], Error>
    func retrieveLocalProductList() -> AnyPublisher<[Product], Error>
    func saveAllProducts(products: [ProductDTO]) -> AnyPublisher<Bool, Error>
}
