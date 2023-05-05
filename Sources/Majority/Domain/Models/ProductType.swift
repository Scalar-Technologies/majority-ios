//
//  ProductType.swift
//  
//
//  Created by Artem Kandaurov on 10.02.2022.
//

import Foundation

/// Product type.
public enum ProductType: String, Decodable {

    /// One-time purchase, can be purchased only once. Non-consumable.
    case oneTime = "one-time"
}
