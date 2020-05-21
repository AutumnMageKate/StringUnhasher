import Foundation

// Adapted from https://stackoverflow.com/questions/42677948/implementing-java-strings-hashcode-method-in-swift-3

extension String {
    var asciiValueArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }

    var hashCode: Int32 {
        var runningHash: Int32 = 0
        for asciiValue in asciiValueArray {
            runningHash = 31 &* runningHash &+ Int32(asciiValue) // Notice use of overflow operators
        }
        return runningHash
    }
}

// Adapted from https://stackoverflow.com/questions/34540185/how-to-convert-index-to-type-int-in-swift

extension String.Index {
    func distance<S: StringProtocol>(in string: S) -> Int {
        string.distance(from: self, to: self)
    }
}
