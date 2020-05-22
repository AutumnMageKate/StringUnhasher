import Foundation

guard let hashCodeString = CommandLine.arguments[safe: 1], let hashCode = Int32(hashCodeString) else {
    print("Hashcode must be a 32-bit integer!")
    exit(1)
}

print("Finding strings for hashcode \(hashCode)")

let lowercase = "abcdefghijklmnopqrstuvwxyz"
let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let both = lowercase + uppercase

// This is super inefficient memory-wise

//var stringsToCheck = [""]
//var stop = false
//
//repeat {
//    let candidate = stringsToCheck.removeFirst()
//    if candidate.hashCode == hashCode {
//        print(candidate)
//    }
//    stringsToCheck.append(contentsOf: StringFinder.nextStrings(for: candidate, availableCharacters: both))
//    stop = candidate.count > 4
//} while (!stop)


// Better memory-wise but still slow because it's brute forcing

var candidate = ""
var stop = false

repeat {
    if candidate.hashCode == hashCode {
        print(candidate)
    }
    candidate = StringFinder.nextString(for: candidate, availableCharacters: both)
    stop = candidate.count > 4
} while (!stop)
