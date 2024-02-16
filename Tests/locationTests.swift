import XCTest
@testable import SMAP
class LocationTests: XCTestCase {

  func testLocation() {
    print("TEST: Location.swift")

    let location = Location(latitude: 46.49619, longitude: 7.5638251)
    print(location)
    print(location.mapURL)
    print(location.coordinateString)


  }

}
