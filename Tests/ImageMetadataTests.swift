//
// SMAP Tests
//

import XCTest
@testable import smap

class ImageMetadataTests: XCTestCase {

  var imageURL: URL { 
    let bundle = Bundle.module 
    guard let url = bundle.url(forResource: "testImage", withExtension: "jpg") else {
          XCTFail("Failed to locate testImage.jpg in test bundle.")
          fatalError("Failed to locate testImage.jpg in test bundle")
      }
    // print("Test-Image-URL: \(url.absoluteString)")
    return url
    }

  func testInitWithFile() {
    let imageMetadata = ImageMetadata(for: imageURL)
    XCTAssertNotNil(imageMetadata.properties)

    // print(imageMetadata.properties ?? "nil")
  }

  func testInitNoFile() {
    let noFileURL = URL(string: "https://www.trafina.ch")!
    let noImageMetadata = ImageMetadata(for: noFileURL)
    XCTAssertNil(noImageMetadata.properties)
  }

  func testDumpDebugProperties() {
    let imageMetadata = ImageMetadata(for: imageURL)
    imageMetadata.debugDescription()
  }

 /*

Get coordinates to test with exiftool:

testImage.jpg exiftool use exiftool -a -G1 -s -n -ee '-gps*' xxx.jpg 
[GPS]           GPSVersionID                    : 2 2 0 0
[GPS]           GPSLatitudeRef                  : N
[GPS]           GPSLatitude                     : 46.6239383333333
[GPS]           GPSLongitudeRef                 : E
[GPS]           GPSLongitude                    : 8.46906333333333
[GPS]           GPSAltitude                     : 2999.4602
[Composite]     GPSLatitude                     : 46.6239383333333
[Composite]     GPSLongitude                    : 8.46906333333333
[Composite]     GPSPosition                     : 46.6239383333333 8.46906333333333

*/
  
  func testCoordinateProperties() {
    let imageMetadata = ImageMetadata(for: imageURL)
  
    let longitude = imageMetadata.longitude()
    XCTAssertNotNil(longitude)
    XCTAssertEqual(longitude!, 8.4690633333333, accuracy: 0.0000001)

    let latitude = imageMetadata.latitude()
    XCTAssertNotNil(latitude)
    XCTAssertEqual(latitude!, 46.6239383333333, accuracy: 0.0000001)
    // print("Longitude \(longitude!), latitude \(latitude!)")
 }
}
