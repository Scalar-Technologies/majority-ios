import XCTest
@testable import Majority

final class MajorityTests: XCTestCase {

    func testInitialization() {
        Majority.initialize(apiKey: "secret-api-key", options: nil)
        let _ = Majority.shared
    }
}
