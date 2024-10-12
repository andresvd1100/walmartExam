//
//  ProductCardView.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import SwiftUI

struct ProductCardView: View {
    let product: ProductDTO
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orange)
            }
            Spacer()
            if product.image != "" {
                ImageFromURL(
                    urlString: product.image,
                    width: 100,
                    height: 100,
                    contentMode: .fit,
                    cornerRadius: 5
                )
                    
            }
            
        }
        .padding()
        .background(
            Color.white.cornerRadius(
                10
            )
            .shadow(radius: 10)
        )
    }
}

#Preview {
    ProductCardView(
        product: .init(
            id: 1,
            name: "Product 1",
            price: 100.0,
            image: ""
        )
    )
}
