//
//  ProductDataManager.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
import Combine
import CoreData

struct ProductDataManager: ProductDataManagerProtocol {

    let apiClient: ManagerAPIClient<ProductEndpoint>
    let persistentContainer: NSPersistentContainer
    
    init(apiClient: ManagerAPIClient<ProductEndpoint>) {
        self.apiClient = apiClient
        self.persistentContainer = PersistenceController.shared.container
    }
    
    func retrieveProductList() -> AnyPublisher<[ProductModel], any Error> {
        let cancellable: AnyPublisher<Response<[ProductModel]>, APIError<CommonError>>
        cancellable = apiClient.perform(ProductEndpoint.retrieveAllProducts)
        return cancellable
            .map(\.value)
            .mapError { error -> Error in
                error as Error
            }
            .eraseToAnyPublisher()
    }
    
    func saveAllProducts(products: [ProductDTO] ) -> AnyPublisher<Bool, Error> {
        let cancellable: AnyPublisher<Bool, Error>
        let context = persistentContainer.newBackgroundContext()
        return Future<Bool, Error> { promise in
            context.performAndWait {
                do {
                    let request: NSFetchRequest<Product> = Product.fetchRequest()
                    let existProductEntity = try context.fetch(request)
                    let existProductId = existProductEntity.compactMap{ $0.id }
                    products.forEach { product in
                        if !existProductId.contains(Int16(product.id)) {
                            let productEntity = Product(context: context)
                            productEntity.id = Int16(product.id)
                            productEntity.name = product.name
                            productEntity.image = product.image
                            productEntity.price = product.price
                        }
                    }
                    try context.save()
                    promise(.success(true))
                } catch {
                    print("Fallo al guardar en la Base de datos")
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func retrieveLocalProductList() -> AnyPublisher<[Product], any Error> {
        print("Obteniendo productos guardados...")
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        let context = self.persistentContainer.viewContext
        return Future<[Product], Error> { promise in
            do {
                let productEntities = try context.fetch(request)
                print("Productos \(productEntities.count)")
                promise(.success(productEntities))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    
}
