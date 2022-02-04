//
//  Majority+GetAvailableProducts.swift
//  
//
//  Created by Artem Kandaurov on 05.02.2022.
//

import Combine
import Foundation

public extension Majority {

    @available(iOS 13.0, *)
    func getAvailableProducts() -> AnyPublisher<[Product], APIError> {
        let requester = Requester()
        // TODO: Create a request `/getAvailableProducts`.
        return Fail(error: APIError.webConsole(statusCode: 502, description: "Mock description."))
            .compactMap { nil }
            .eraseToAnyPublisher()
    }
}

