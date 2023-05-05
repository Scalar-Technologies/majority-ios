//
//  File.swift
//  
//
//  Created by Artem Kandaurov on 05.05.2023.
//

import Foundation

struct APIProducts: Decodable {
    let result: [Product]

    enum CodingKeys: CodingKey {
        case result
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.result = try container.decode([Product].self, forKey: .result)
    }
}
