import XCTest

class StringFinderTests: XCTestCase {
    
    let abc = "abc"
    
    // MARK: - NextStrings()
    
    func testCanHandleEmptyString() {
        XCTAssertEqual(StringFinder.nextStrings(for: "", availableCharacters: abc), ["a", "b", "c"])
    }
    
    func testCanHandleNonEmptyString() {
        XCTAssertEqual(StringFinder.nextStrings(for: "d", availableCharacters: abc), ["da", "db", "dc"])
    }
    
    // MARK: - NextString()
    
    func testCanGenerateFirstString() {
        XCTAssertEqual(StringFinder.nextString(for: "", availableCharacters: abc), "a")
    }
    
    func testCanGenerateOneCharacterStrings() {
        XCTAssertEqual(StringFinder.nextString(for: "a", availableCharacters: abc), "b")
        XCTAssertEqual(StringFinder.nextString(for: "b", availableCharacters: abc), "c")
        XCTAssertEqual(StringFinder.nextString(for: "c", availableCharacters: abc), "aa")
    }
    
    func testCanGenerateTwoCharacterStrings() {
        XCTAssertEqual(StringFinder.nextString(for: "aa", availableCharacters: abc), "ab")
        XCTAssertEqual(StringFinder.nextString(for: "ab", availableCharacters: abc), "ac")
        XCTAssertEqual(StringFinder.nextString(for: "ac", availableCharacters: abc), "ba")
        XCTAssertEqual(StringFinder.nextString(for: "ba", availableCharacters: abc), "bb")
        XCTAssertEqual(StringFinder.nextString(for: "bb", availableCharacters: abc), "bc")
        XCTAssertEqual(StringFinder.nextString(for: "bc", availableCharacters: abc), "ca")
        XCTAssertEqual(StringFinder.nextString(for: "ca", availableCharacters: abc), "cb")
        XCTAssertEqual(StringFinder.nextString(for: "cb", availableCharacters: abc), "cc")
        XCTAssertEqual(StringFinder.nextString(for: "cc", availableCharacters: abc), "aaa")
    }
    
    func testCanGenerateFiveCharacterStrings() {
        XCTAssertEqual(StringFinder.nextString(for: "abbcb", availableCharacters: abc), "abbcc")
        XCTAssertEqual(StringFinder.nextString(for: "abbcc", availableCharacters: abc), "abcaa")
        XCTAssertEqual(StringFinder.nextString(for: "ccccc", availableCharacters: abc), "aaaaaa")
    }
    
    func testCanIgnoreUnknownLetters() {
        XCTAssertEqual(StringFinder.nextString(for: "abFcb", availableCharacters: abc), "abFcc")
        XCTAssertEqual(StringFinder.nextString(for: "acFcc", availableCharacters: abc), "baFaa")
    }
}
