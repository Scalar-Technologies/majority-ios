//
//  Product.swift
//  
//
//  Created by Artem Kandaurov on 05.02.2022.
//

import Foundation

/// In-App Purchase.
public struct Product: Codable {

    /// Product ID unique within one project.
    let id: String
    /// Product type.
    let type: ProductType
    /// Product price.
    let price: ProductPrice
}
