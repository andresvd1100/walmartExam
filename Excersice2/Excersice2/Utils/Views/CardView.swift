//
//  CardView.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import SwiftUI

struct CardView: View {
    let backgroundColor: Color
    let title: String
    let fontColor: Color
    let height: CGFloat
    let width: CGFloat
    let font: Font
    let fontWeight: Font.Weight
    
    init(
        backgroundColor: Color = .blue,
        fontColor: Color = .white,
        title: String,
        height: CGFloat = 200,
        width: CGFloat = .infinity,
        font: Font = .largeTitle,
        fontWeight: Font.Weight = .bold
    ) {
        self.backgroundColor = backgroundColor
        self.title = title
        self.fontColor = fontColor
        self.height = height
        self.width = width
        self.font = font
        self.fontWeight = fontWeight
    }
    var body: some View {
        ZStack{
            VStack {
                Text(title)
                    .font(font)
                    .fontWeight(fontWeight)
                    .foregroundStyle(fontColor)
                    .frame(maxWidth: width)
            }
            .padding()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor.opacity(0.6))
                .frame(
                    height: height
                    
                )
                .padding()
        }
    }
        
}

#Preview {
    CardView(title: "Hola mundo")
}
