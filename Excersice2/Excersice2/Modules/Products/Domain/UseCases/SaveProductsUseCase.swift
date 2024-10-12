//
//  SaveProductsUseCase.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
import Combine

struct SaveProductsUseCase: SaveProductsProtocol {
    
    let repository: ProductRepositoryProtocol
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(products: [ProductDTO]) -> AnyPublisher<Bool, any Error> {
        repository
            .saveAllProducts(products: products)
            .eraseToAnyPublisher()
        
    }
}
