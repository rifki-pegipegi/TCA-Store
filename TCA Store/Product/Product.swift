//
//  Product.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 09/05/23.
//

import Foundation

struct Product:  Equatable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let imageString: String
}

extension Product {
    static var sample: [Product] {
        [
            .init(
                id: 1,
                title: "Mens Casual Premium Slim Fit T-Shirts",
                price: 22.3,
                description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
                category: "men's clothing",
                imageString: "tshirt"
            ),
            .init(
                id: 2,
                title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                price: 109.95,
                description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                category: "men's clothing",
                imageString: "bag"
            ),
            .init(
                id: 3,
                title: "Mens Cotton Jacket",
                price: 55.99,
                description: "Great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
                category: "men's clothing",
                imageString: "jacket"
            )
        ]
    }
}