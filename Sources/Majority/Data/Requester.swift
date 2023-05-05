//
//  Requester.swift
//  
//
//  Created by Artem Kandaurov on 05.02.2022.
//

import Combine
import Foundation

final class Requester {

    private enum Path: String {
        case availableProducts = "/api/v1/available-products"
        case purchasedProducts = "/api/v1/purchased-products"
    }

    private let baseURL = URL(string: "http://192.168.50.175:3000")!
    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func availableProducts() -> AnyPublisher<[Product], APIError> {
        var availableProductsRequest = URLRequest(url: baseURL.appendingPathExtension(Path.availableProducts.rawValue))
        availableProductsRequest.addValue(apiKey, forHTTPHeaderField: "UUID") // unique per project
        return URLSession.shared
            .dataTaskPublisher(for: availableProductsRequest)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse else {
                    throw APIError.unknown
                }
                guard 200..<300 ~= response.statusCode else {
                    throw APIError.network(statusCode: response.statusCode, description: response.description)
                }

                return data
            }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .mapError { error in
                if let decodingError = error as? DecodingError {
                    return APIError.decoding(description: decodingError.errorDescription)
                } else if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.unknown
                }
            }
            .eraseToAnyPublisher()
    }

    func purchasedProducts() -> AnyPublisher<[Product], APIError> {
        var availableProductsRequest = URLRequest(url: baseURL.appendingPathExtension(Path.purchasedProducts.rawValue))
        availableProductsRequest.addValue(apiKey, forHTTPHeaderField: "UUID") // unique per project
        // TODO: Retrieve access token from the backend
        availableProductsRequest.addValue("", forHTTPHeaderField: "Access token") // unique per user
        return URLSession.shared
            .dataTaskPublisher(for: availableProductsRequest)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse else {
                    throw APIError.unknown
                }
                guard 200..<300 ~= response.statusCode else {
                    throw APIError.network(statusCode: response.statusCode, description: response.description)
                }
                return data
            }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .mapError { error in
                if let decodingError = error as? DecodingError {
                    return APIError.decoding(description: decodingError.errorDescription)
                } else if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.unknown
                }
            }
            .eraseToAnyPublisher()
    }
}
