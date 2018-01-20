//: [Previous](@previous)

import Foundation

enum ParseLocationError: Error {
    case invalidData
    case locationDoesNotExist
    case middleOfTheOcean
}

struct MultipleParseLocationErrors: Error {
    let parsingErrors: [ParseLocationError]
    let isShownToUser: Bool
}

struct Location {
    let latitude: Double
    let longitude: Double
}

/// Turns two strings with a latitude and longitude value into a Location type
///
/// - Parameters:
///   - latitude: A string containing a latitude value
///   - longitude: A string containing a longitude value
/// - Returns: A Location struct
/// - Throws: Can throw a ParseLocationError.invalidData error
func parseLocation(_ latitude: String, _ longitude: String) throws -> Location {
    guard let latitude = Double(latitude), let longitude = Double(longitude) else {
        throw ParseLocationError.invalidData
    }
    
    return Location(latitude: latitude, longitude: longitude)
}

do {
    try parseLocation("I am not a double", "110") <2>
} catch {
    print(error) // invalidData <1>
}

//: [Next](@next)