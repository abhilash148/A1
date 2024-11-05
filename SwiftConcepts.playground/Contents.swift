import UIKit


// Enumerations

/// 1. Enum defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.
/// 2. Enumerations in Swift are first-class types in their own right. They adopt many features traditionally supported only by classes,
///   such as computed properties to provide additional information about the enumeration’s current value,
///   and instance methods to provide functionality related to the values the enumeration represents
/// 3. Enumerations can also define intializers to provide initial case value and can be extended to add functionality;
///   can conform to protocols to provide standard functionality.

enum CompassPoint {
    case south
    case west
    case east
    case north
}

var directionToHead = CompassPoint.east

/// 4. If a case is missing in switch statement then it throws compile time error
///  (Switch must be exhaustive): to fix the error introduce the default case at the end of switch

switch directionToHead {
    case .east:
        print("Move to east")
    default:
        print("Move any direction other than east")
}

/// 5. Iterating over enum cases
/// Enum should conform to CaseIterable protocol
/// When it conforms there is a property called 'allcases' to access the collection.
/// which allows to iterate over the enum cases

enum Beverage: CaseIterable {
    case coffee, juice, tea
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

/// 6. Associated values

/// Define an enumeration type called Barcode, which can take either a value of upc with an
/// associated value of type (Int, Int, Int, Int) or a value of qrCode with an
/// associated value of type String.
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarCode = Barcode.upc(8, 12345, 67890, 1)
productBarCode = .qrCode("2dstring")


/// associated values are extracted as part of switch statement. You can extract each associated
/// value as either constant(with a let prefix) or a variable(with a var prefix) for use within
/// switch case's body.

switch productBarCode {
    case .upc(let a, let b, let c, let d):
        print("UPC value: \(a)-\(b) \(c)-\(d)")
    case .qrCode(let code):
        print("QRCode: \(code)")
}

/// if all of the associated values are extracted as constants or variales, you can place a single let or var annotation before the case name

switch productBarCode {
    case let .upc(a, b, c, d):
        print("UPC value: \(a)-\(b) \(c)-\(d)")
    case var .qrCode(code):
        print("QRCode: \(code)")
}

/// 7. Raw values
/// Enumeration cases with default values are called Raw values, which are all of the same type.

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case linefeed = "\n"
    case carriageReturn = "\r"
}

/// 8. Implicitly Assigned Raw Values
/// When working with strings or Integers, you don't have to explicitly assign a raw value
/// for each case.
/// for integers, implicit value for each case is one more than the previous case.


enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupyter, saturn, uranus, neptune
}

/// In the above example, Planet.mercury has a default raw value of 1,
/// Planet.venus has a raw value of 2 and so on.

enum Compass: String {
    case north, south, east, west
}

/// In the above example Compass.south has a implicit rawValue of "south" and so on.
/// You can access the rawValue of an enumeration using rawValue property
let southValue = Compass.south.rawValue


/// Initializing from a rawValue
let possiblePlanet = Planet(rawValue: 7)
print(possiblePlanet)


