//
//  ContentViewModel.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    var productUseCases: ProductUseCases
    var repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
        self.productUseCases = ProductUseCases(
            retrieve: RetrieveProductsUseCase(repository: repository),
            local: LoadProductsFromDBUseCase(repository: repository),
            save: SaveProductsUseCase(repository: repository)
        )
    }
}
