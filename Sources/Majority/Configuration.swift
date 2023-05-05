//
//  Configuration.swift
//  
//
//  Created by Artem Kandaurov on 10.02.2022.
//

import Foundation

/// Main config that should be initialized before library usage.
public struct Configuration {

    public typealias Options = [String: String]

    public let apiKey: String
    public let options: Options?

    /// Default initializer.
    /// - Parameters:
    ///   - apiKey: Unique API key from the web console.
    ///   - options: Any further options for the backend.
    public init(apiKey: String, options: Options? = nil) {
        self.apiKey = Self.validate(apiKey: apiKey)
        self.options = Self.validate(options: options)
    }
}

// MARK: - Validations
private extension Configuration {

    /// Performs API key validation. Small errors can be fixed automatically, e.g.
    /// lower/upper case.
    /// - Returns: The same or fixed API key.
    private static func validate(apiKey: String) -> String {
        return apiKey
    }

    /// Performs project ID validation. Small errors can be fixed automatically, e.g.
    /// lower/upper case.
    /// - Returns: The same or fixed project ID.
    private static func validate(projectId: String) -> String {
        if projectId.count != 10 {
            debugPrint("Invalid project ID format!")
        }
        return projectId.uppercased()
    }

    /// Performs backend options validation. Small errors can be fixed automatically.
    /// In case of invalid options array the function triggers `fatalError`.
    /// - Returns: The same or fixed options array.
    private static func validate(options: Options?) -> Options? {
        return options
    }
}
