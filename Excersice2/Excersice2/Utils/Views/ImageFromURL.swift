//
//  ImageFromURL.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import SwiftUI

struct ImageFromURL: View {
    let urlString: String
    let width: CGFloat
    let height: CGFloat
    let contentMode: ContentMode
    let cornerRadius: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: urlString)) {
            phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .cornerRadius(cornerRadius)
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: width, height: height)
            case .failure(let error):
                Image(systemName: "photo")
                    .imageScale(.large)
            default:
                EmptyView()
            }
        }
    }
}


