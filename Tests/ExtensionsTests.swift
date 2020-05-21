import XCTest

class ExtensionsTests: XCTestCase {

    func testHash() {
        XCTAssertEqual("a".hashCode, Int32(97))
        XCTAssertEqual("aa".hashCode, Int32(3104))
        XCTAssertEqual("ab".hashCode, Int32(3105))
        XCTAssertEqual("aaaaaa".hashCode, Int32(-1425372064))
    }
}
