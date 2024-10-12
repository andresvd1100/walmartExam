//
//  RetrieveProductsUseCase.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
import Combine

struct RetrieveProductsUseCase: RetrieveProductsProtocol {
    
    private let repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[ProductDTO], Error> {
        return repository.retrieveProductList()
            .map{mapperProductDTO($0)}
            .mapError( { error -> ProductError in
                return .generic
            })
            .eraseToAnyPublisher()
    }
    
    func mapperProductDTO(_ productModels: [ProductModel]) -> [ProductDTO] {
        var products: [ProductDTO] = []
        for model in productModels {
            if let id = model.id,
               let title = model.title,
               let price = model.price {
                products.append(
                    .init(
                        id: id,
                        name: title,
                        price: price,
                        image: model.image ?? ""
                    )
                )
            }
        }
        return products
    }
    
    
}
