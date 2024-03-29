import XCTest
@testable import smap

class MapTypeTests: XCTestCase {
  // GPS Lochberg
  let latitude = 46.62393833333333
  let longitude = 8.46906333333333
  var location :Location { Location(latitude: latitude, longitude: longitude) } 

  var resultSwissMap: String { "https://map.geo.admin.ch/?swisssearch=\(latitude),\(longitude)" }
  var resultOsmMap: String { "https://www.openstreetmap.org/?mlat=\(latitude)&mlon=\(longitude)&map=18/\(latitude)/\(longitude)&layers=Y" } 

  var resultPlaceholderMap: String { "https://placehold.co/600x400?text=Map\\nLat=\(latitude)\\nLon=\(longitude)" }

  func testSwissMap() {
    let mapURL = MapType.swiss.createMap(for: location).mapURL()
    let cleanMapURL = mapURL.absoluteString.removingPercentEncoding!

    XCTAssertEqual(resultSwissMap, cleanMapURL)
  } 

  func testOsmMap() {
    let mapURL = MapType.osm.createMap(for: location).mapURL()
    let cleanMapURL = mapURL.absoluteString.removingPercentEncoding!

    XCTAssertEqual(resultOsmMap, cleanMapURL)
  }

  func testPlaceholderMap() {
    let mapURL = MapType.placeholder.createMap(for: location).mapURL()
    let cleanMapURL = mapURL.absoluteString.removingPercentEncoding!
    XCTAssertEqual(resultPlaceholderMap,cleanMapURL)
  }

  func testMapTypeArguments() throws {
    let tests: [String : (argument: String, maptype: MapType)] = [
      "empty": ("", MapType.swiss),
      "osm":   ("osm", MapType.osm),
      "swiss": ("swiss", MapType.swiss),
      "placeholder": ("placeholder", MapType.placeholder)
      ]
    try tests.forEach { test in
      let testName = test.key
      let testArgument = test.value.argument
      let testExpectedMapType = test.value.maptype
      let resultMapType = MapType.create(from: testArgument)
      XCTAssertNotNil(resultMapType,
        "testMapTypeArguments: \(testName) argument \"\(testArgument) failed to return MapType \(testExpectedMapType)"
      ) 
      print(testName, "passed")
      let unwrappedResultMapType = try XCTUnwrap(resultMapType)
      XCTAssertEqual(unwrappedResultMapType,testExpectedMapType)
    } 
/*
    let empty = ""
    let emptyMap = MapType.create(from: empty)
    XCTAssertNotNil(emptyMap,
      "testMapTypeArguments: empty string failed"
    ) 
    XCTAssertEqual(emptyMap!,MapType.swiss)

    let osm = "osm"
    XCTAssertNotNil(MapType.create(from: osm),
       "testMapTypeArguments: osm string failed"   
    ) 
    let swiss = "swiss"
    XCTAssertNotNil(MapType.create(from: swiss), 
       "testMapTypeArguments: swiss string failed"   
    ) 

    let placeholder = "placeholder"
    XCTAssertNotNil(MapType.create(from: placeholder), 
       "testMapTypeArguments: placeholder string failed"   
    ) 
*/
 
    let wrong = "wrong"
    XCTAssertNil(MapType.create(from: wrong)) 
    
  }


}

