import XCTest
@testable import Git

final class GitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Git().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
