//
//  LoadProductsFromDBUseCase.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
import Combine

struct LoadProductsFromDBUseCase: LoadProductsFromLocalProtocol {
    
    let repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[ProductDTO], any Error> {
        repository
            .retrieveLocalProductList()
            .map{ mapperProductDTO($0) }
            .mapError( { error -> ProductError in
                    .generic
            })
            .eraseToAnyPublisher()
    }
    
    func mapperProductDTO(_ productsEntity: [Product]) -> [ProductDTO] {
        var products: [ProductDTO] = []
        for productEntity in productsEntity {
            products.append(
                .init(
                    id: Int(productEntity.id),
                    name: productEntity.name ?? "",
                    price: productEntity.price,
                    image: productEntity.image ?? ""
                )
            )
        }
        return products
    }
    
    
}
