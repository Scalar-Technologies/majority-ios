//
//  ProductType.swift
//  
//
//  Created by Artem Kandaurov on 10.02.2022.
//

import Foundation

/// Product type.
public enum ProductType: Codable {

    /// One-time purchase, can be purchased only once. Non-consumable.
    case oneTime(isPurchased: Bool)

    // MARK: - Initialization

    public init(from decoder: Decoder) throws {

        enum CodingKeys: String, CodingKey {
            case name
            case purchased
        }

        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        let name = try keyedContainer.decode(String.self, forKey: .name)
        switch name {
        case "one-time":
            let isPurchased = try keyedContainer.decode(Bool.self, forKey: .purchased)
            self = .oneTime(isPurchased: isPurchased)
        default:
            fatalError("Cannot parse `ProductType` response from web console!")
        }
    }
}
