//
//  ProductItem.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import SwiftUI

struct ProductItem: View {
    let product: ProductDTO
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(product.name.capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orange)
            }
            Spacer()
            
        }
        .padding()
        .background(
            Color.black.cornerRadius(
                10
            )
        )
    }
}

#Preview {
    ProductItem(
        product: .init(
            id: 1,
            name: "Product 1",
            price: 100.0,
            image: ""
        )
    )
}
