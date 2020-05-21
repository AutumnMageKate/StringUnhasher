import XCTest

class StringFinderTests: XCTestCase {
    
    let abc = "abc"
    
    func testCanHandleEmptyString() {
        XCTAssertEqual(StringFinder.nextStrings(for: "", availableCharacters: abc), ["a", "b", "c"])
    }
    
    func testCanHandleNonEmptyString() {
        XCTAssertEqual(StringFinder.nextStrings(for: "d", availableCharacters: abc), ["da", "db", "dc"])
    }
}
