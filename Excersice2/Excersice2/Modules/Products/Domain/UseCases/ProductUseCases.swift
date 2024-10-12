//
//  ProductUseCases.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation

struct ProductUseCases {
    let retrieve: RetrieveProductsProtocol
    let local: LoadProductsFromLocalProtocol
    let save: SaveProductsProtocol
}
