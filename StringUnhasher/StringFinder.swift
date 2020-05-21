import Foundation

enum StringFinder {
    static func nextStrings(for string: String, availableCharacters: String) -> [String] {
        return availableCharacters.map {
            string + String($0)
        }
    }
    
    static func nextString(for string: String, availableCharacters: String) -> String {
        return nextString(for: string, availableCharacters: availableCharacters.map({$0}))
    }
    
    static func nextString(for string: String, availableCharacters: [Character]) -> String {
        let source = string.map({$0})
        
        guard string.count > 0 else {
            return String(availableCharacters.first!)
        }
        
        guard let indexOfLastNonFinal = source.lastIndex(where: { $0 != availableCharacters.last! && availableCharacters.contains($0) }) else {
            return String(repeating: availableCharacters.first!, count: string.count + 1)

        }
        
        let lastNonFinal = source[indexOfLastNonFinal]
        let indexInAvailable = availableCharacters.firstIndex(of: lastNonFinal)!
        let nextCharacterInSequence = availableCharacters[indexInAvailable + 1]
        
        let answer = source.enumerated().map { (index, character) -> Character in
            guard availableCharacters.contains(character) else {
                return character
            }
            if index == indexOfLastNonFinal {
                return nextCharacterInSequence
            } else if index > indexOfLastNonFinal {
                return availableCharacters.first!
            } else {
                return character
            }
        }
        
        return String(answer)
    }
}
