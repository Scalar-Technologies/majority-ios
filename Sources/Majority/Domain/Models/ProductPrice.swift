//
//  ProductPrice.swift
//  
//
//  Created by Artem Kandaurov on 10.02.2022.
//

import Foundation

/// Product price in USD.
public struct ProductPrice: Codable {

    /// Integer part of the price in USD. E.g. `1` for $1.99.
    let integerPrice: Int
    /// Fractional part of the price in decimal numbers in USD. E.g. `99` for $1.99.
    let fractionalPrice: Int
}
