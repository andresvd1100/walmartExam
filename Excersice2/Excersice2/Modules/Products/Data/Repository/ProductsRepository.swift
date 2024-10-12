//
//  ProductsRepository.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
import Combine

struct ProductsRepository: ProductRepositoryProtocol {
    
    let dataManager: ProductDataManager
    
    init(dataManager: ProductDataManager) {
        self.dataManager = dataManager
    }
    
    func retrieveProductList() -> AnyPublisher<[ProductModel], any Error> {
        dataManager.retrieveProductList()
    }
    
    func retrieveLocalProductList() -> AnyPublisher<[Product], any Error> {
        dataManager.retrieveLocalProductList()
    }
    
    func saveAllProducts(products: [ProductDTO]) -> AnyPublisher<Bool, any Error> {
        dataManager.saveAllProducts(products: products)
    }
    
    
}
