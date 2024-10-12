//
//  ProductsDomainProtocols.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
import Combine
protocol RetrieveProductsProtocol {
    func execute() -> AnyPublisher<[ProductDTO], Error>
}

protocol LoadProductsFromLocalProtocol {
    func execute() -> AnyPublisher<[ProductDTO], Error>
}

protocol SaveProductsProtocol {
    func execute(products: [ProductDTO]) -> AnyPublisher<Bool, Error>
}
