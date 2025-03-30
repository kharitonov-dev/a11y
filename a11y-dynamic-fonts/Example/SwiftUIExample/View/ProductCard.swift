//
//  ProductCard.swift
//  a11y-dynamic-fonts
//
//  Created by Timofey Kharitonov on 30.03.2025.
//

import SwiftUI

struct ProductCard: View {
    let product: ProductModel
    
    @Environment(\.fontSizeCategory) private var fontSizeCategory
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .padding()
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                if product.isFavorite {
                    Image(systemName: "heart.fill")
                        .font(.customFont(style: .headlineMedium, isDynamic: true))
                        .foregroundColor(.pink)
                        .padding(8)
                        .background(Circle().fill(Color.white))
                        .offset(x: -8, y: 8)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
            }
            
            VStack(alignment: fontSizeCategory > .normal ? .center : .leading, spacing: 4) {
                Text(product.name)
                    .foregroundStyle(.black)
                    .font(.customFont(style: .headlineMedium, isDynamic: true))
                    .lineLimit(1)
                
                HStack {
                    ForEach(0..<5) { star in
                        Image(systemName: star < product.rating ? "star.fill" : "star")
                            .font(.customFont(style: .headlineMedium, isDynamic: true))
                            .foregroundColor(.yellow)
                            .imageScale(.small)
                    }
                }
                
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.customFont(style: .headlineMedium, isDynamic: true))
                    .foregroundStyle(.black)
                    .bold()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}
