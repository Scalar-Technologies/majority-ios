//
//  APIError.swift
//  
//
//  Created by Artem Kandaurov on 05.02.2022.
//

import Foundation

public enum APIError: Decodable, Error {
    
    /// Error coming from web console.
    case network(statusCode: Int, description: String)
    /// Error indicating fail during data decoding.
    case decoding(description: String?)
    /// Any unhandled API error.
    case unknown

    // MARK: - Initialization

    init(httpStatusCode: Int, body: Data?) {
        if let body = body, !body.isEmpty {
            do {
                self = try JSONDecoder().decode(APIError.self, from: body)
            } catch {
                if httpStatusCode < 500 {
                    assertionFailure("Failed to parse backend error \"\(error.localizedDescription)\" with status code \(httpStatusCode)")
                }
                self.init(httpStatusCode: httpStatusCode, description: "Unknown error.")
            }
        } else {
            self.init(httpStatusCode: httpStatusCode, description: "Empty error.")
        }
    }

    init(httpStatusCode: Int, description: String) {
        self = .network(statusCode: httpStatusCode, description: description)
    }

    public init(from decoder: Decoder) throws {

        enum CodingKeys: String, CodingKey {
            case statusCode
            case description
        }

        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        let statusCode = try keyedContainer.decode(Int.self, forKey: .statusCode)
        let description = try keyedContainer.decode(String.self, forKey: .description)
        self = .network(statusCode: statusCode, description: description)
    }
}
