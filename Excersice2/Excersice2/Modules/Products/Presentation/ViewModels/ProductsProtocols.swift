//
//  ProductsProtocols.swift
//  Excersice2
//
//  Created by Andres Valerio on 11/10/24.
//

import Foundation

protocol ProductsProtocols: ObservableObject {
    var products: [ProductDTO] { get set }
    var isFromDB: Bool { get set }
    var titleAlert: String { get set }
    var messageAlert: String { get set }
}
