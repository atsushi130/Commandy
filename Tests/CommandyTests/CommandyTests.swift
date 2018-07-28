import XCTest
@testable import Commandy

class CommandyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Commandy().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
