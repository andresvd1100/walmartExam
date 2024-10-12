//
//  ProductViewModel.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//

import Foundation
import Combine
import SwiftUI

class ProductViewModel: ProductsProtocols {

    @Published var products: [ProductDTO]
    @Published var gridItem: [GridItem]
    @Published var isFromDB: Bool
    @Published var showAlert: Bool
    @Published var titleAlert: String
    @Published var messageAlert: String
    var productUseCases: ProductUseCases
    var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(isFromDB: Bool, productUseCases: ProductUseCases) {
        print("ProductViewModel called")
        self.products = []
        self.showAlert = false
        self.isFromDB = isFromDB
        self.titleAlert = ""
        self.messageAlert = ""
        self.productUseCases = productUseCases
        gridItem = Array(repeating: .init(.flexible(minimum: 200, maximum: .infinity)), count: 1)
    }
    
    func reloadProducts() {
        showAlert = false
        if(isFromDB){
            retrieveAllProductsFromDB()
        } else {
            retrieveAllProducts()
        }
    }
    
    
}

extension ProductViewModel {
    func retrieveAllProducts() {
        self.productUseCases.retrieve.execute()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finish")
                case .failure(_):
                    print("Error case")
                }
            } receiveValue: { products in
                self.products = products
            }
            .store(in: &cancellables)

    }
    
    func retrieveAllProductsFromDB() {
        self.productUseCases.local.execute()
            .sink { completion in
                switch completion {
                    case .finished:
                        print("Finish")
                    case .failure(_):
                        print("Error load case")
                }
            
            } receiveValue: { products in
                self.products = products
            }
            .store(in: &cancellables)
    }
    
    func saveProductsOnLocal() {
        self.productUseCases.save.execute(products: self.products)
            .sink { completion in
                switch completion {
                    case .finished:
                        print("Finished")
                    case .failure(_):
                        self.titleAlert = "Error"
                        self.messageAlert = "No se pudo guardar los productos localmente, intente más tarde"
                        self.showAlert.toggle()
                        print("Falla al guardar")
                }
            } receiveValue: { saved in
                self.titleAlert = "Listo!!"
                self.messageAlert = "Productos guardados localmente"
                self.showAlert.toggle()
                print("Saved")
            }

    }
}


