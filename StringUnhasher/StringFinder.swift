import Foundation

enum StringFinder {
    static func nextStrings(for string: String, availableCharacters: String) -> [String] {
        return availableCharacters.map {
            string + String($0)
        }
    }
}
