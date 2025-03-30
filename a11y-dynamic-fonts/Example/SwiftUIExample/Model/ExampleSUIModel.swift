//
//  ExampleSUIModel.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 22.03.2025.
//

import Foundation

struct ExampleSUIModel {
	let profile: ProfileModel
}

struct ProfileModel {
	let name: String
	let phone: String
}

struct ProductModel: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
    let rating: Int
    var isFavorite: Bool
}

extension ProductModel {
    static let mock: [ProductModel] = [
        ProductModel(name: "iPhone 16", price: 999.99, imageName: "iphone", rating: 5, isFavorite: true),
        ProductModel(name: "MacBook Pro", price: 1999.99, imageName: "laptopcomputer", rating: 4, isFavorite: false),
        ProductModel(name: "Apple Watch", price: 399.99, imageName: "applewatch", rating: 5, isFavorite: true),
        ProductModel(name: "AirPods Pro", price: 249.99, imageName: "airpodspro", rating: 4, isFavorite: false),
        ProductModel(name: "iPad Pro", price: 799.99, imageName: "ipad", rating: 5, isFavorite: true),
        ProductModel(name: "HomePod", price: 299.99, imageName: "homepod", rating: 3, isFavorite: false)
    ]
}
