import Foundation

public final class Majority {

    /// Should be set in `Majority.initialize`.
    private static var configuration: Configuration? = nil
    /// The only created library instance.
    private static var _shared = Majority()

    /// Singleton getter. Accessible for everyone from everywhere.
    public static var shared: Majority {
        guard let _ = configuration else {
            fatalError("Use `Majority.initialize` function before using the library!")
        }
        return _shared
    }

    // MARK: - Initialization

    /// This function should be called before any interaction with the library. Otherwise,
    /// `fatalError` will be triggered.
    /// - Parameters:
    ///   - apiKey: API key from the web console.
    ///   - options: Any further options.
    public class func initialize(apiKey: String, options: [String: String]? = nil) {
        guard self.configuration == nil else {
            fatalError("You can initialize the library only once!")
        }
        self.configuration = Configuration(apiKey: apiKey, options: options)
    }

    /// Unaccessible default initializer.
    private init() { }
}
