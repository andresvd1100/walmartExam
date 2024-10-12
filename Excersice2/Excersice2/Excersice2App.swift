//
//  Excersice2App.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//

import SwiftUI

@main
struct Excersice2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            /*ProductView(
                viewModel: ProductViewModel(
                    products: [],
                    productUseCase: RetrieveProductsUseCase(
                        repository: ProductsRepository(
                            dataManager: ProductDataManager(
                                apiClient: ManagerAPIClient<ProductEndpoint>()
                            )
                        )
                    )
                )
            )*/
            ContentView(viewModel: ContentViewModel(repository: ProductsRepository(dataManager: ProductDataManager(apiClient: ManagerAPIClient<ProductEndpoint>()))))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
