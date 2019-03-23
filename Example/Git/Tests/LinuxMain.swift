import XCTest

import GitTests

var tests = [XCTestCaseEntry]()
tests += GitTests.allTests()
XCTMain(tests)