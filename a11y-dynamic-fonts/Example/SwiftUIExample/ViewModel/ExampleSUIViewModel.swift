//
//  ExampleSUIViewModel.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 22.03.2025.
//

import SwiftUI

class ExampleSUIViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var products: [ProductModel] = []
    
    // MARK: - Construction
    
    init() {
        loadProducts()
    }
    
    // MARK: - Functions
    
    func loadProducts() {
        products = ProductModel.mock
    }
    
    func toggleFavorite(for product: ProductModel) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isFavorite.toggle()
        }
    }
}
