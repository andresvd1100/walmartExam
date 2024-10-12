//
//  ProductView.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel: ProductViewModel
    
    init(viewModel: ProductViewModel) {
        print("ProductView called")
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.gridItem, spacing: 8) {
                    ForEach(viewModel.products, id: \.id) { product in
                        viewModel.isFromDB ? AnyView(ProductItem(product: product)) : AnyView(ProductCardView(product: product))
                        
                    }
                }
                .padding()
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text(viewModel.titleAlert),
                        message: Text(viewModel.messageAlert),
                        dismissButton: .default(Text("Ok")) {
                            withAnimation {
                                viewModel.showAlert.toggle()
                            }
                        }
                    )
                }
            }
            .navigationTitle(
                viewModel.isFromDB ? "Productos desde Local" : "Productos desde API"
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if(!self.viewModel.isFromDB) {
                    Button(action: {
                        viewModel.saveProductsOnLocal()
                    }){
                        Text("Guardar en local")
                    }
                }else {
                    EmptyView()
                }
            }
            
        }
        .onAppear {
            viewModel.reloadProducts()
        }
        
        
    }
}

/*
#Preview {
    ProductView()
}
*/
