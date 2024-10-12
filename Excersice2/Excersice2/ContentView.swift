//
//  ContentView.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject private var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            NavigationStack {
                ZStack{
                    Color.myBlue.opacity(0.9)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        NavigationLink {
                            ProductView(
                                viewModel: ProductViewModel(
                                    isFromDB: false,
                                    productUseCases: self.viewModel.productUseCases)
                            )
                            
                        } label: {
                            CardView(title: "Ver lista de productos")
                        }
                        Spacer()
                        NavigationLink {
                            ProductView(
                                viewModel: ProductViewModel(
                                    isFromDB: true,
                                    productUseCases: self.viewModel.productUseCases)
                            )
                        } label: {
                            CardView(title: "Ver lista guardada")
                        }
                        Spacer()
                    }
                }
            }
        }
    }

}

/*
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}*/
