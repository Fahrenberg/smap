import XCTest
@testable import smap
class LocationTests: XCTestCase {

  // GPS Lochberg
  let latitude = 46.62393833333333
  let longitude = 8.46906333333333

  var imageURL: URL { 
    let bundle = Bundle.module 
    guard let url = bundle.url(forResource: "testImage", withExtension: "jpg") else {
          XCTFail("Failed to locate testImage.jpg in test bundle.")
          fatalError("Failed to locate testImage.jpg in test bundle")
      }
    print("Test-Image-URL: \(url.absoluteString)")
    return url
    }


  func testInitLocation() {
    let location = Location(latitude: latitude,
                           longitude: longitude)

    let resultLatitude = location.latitude
    XCTAssertEqual(resultLatitude, latitude)
    let resultLongitude = location.longitude
    XCTAssertEqual(resultLongitude, longitude)
  }

  func testCoordinateString() {
    let location = Location(latitude: latitude,
                             longitude: longitude)

    let resultCoordinateString = location.coordinateString 
    let expectedCoordinateString = "\(latitude),\(longitude)"
    XCTAssertEqual(resultCoordinateString,expectedCoordinateString) 
  }

  func testReadImageData() throws {
    let location = Location.read(contentsOf: imageURL)
    XCTAssertEqual(location.latitude, latitude, accuracy: 0.000001)
    XCTAssertEqual(location.longitude, longitude, accuracy: 0.000001)
  }
}
