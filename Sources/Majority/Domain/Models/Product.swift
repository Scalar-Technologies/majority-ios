//
//  Product.swift
//  
//
//  Created by Artem Kandaurov on 05.02.2022.
//

import Foundation

/// In-App Purchase.
public struct Product: Identifiable, Decodable {

    /// Product id unique within one project.
    public let id: String
    /// Product name.
    public let name: String
    /// Product name.
    public let description: String
    /// Product type.
    public let type: ProductType
    /// Product price.
    public let price: ProductPrice

    private enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case description
        case type
        case price
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.type = try container.decode(ProductType.self, forKey: .type)
        self.price = try container.decode(ProductPrice.self, forKey: .price)
    }
}

// MARK: - Equatable

extension Product: Equatable {

    public static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
}
