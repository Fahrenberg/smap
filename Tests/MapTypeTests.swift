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

  func testMapTypeArguments() {
    let empty = ""
    XCTAssertNotNil(MapType.create(from: empty), 
      "testMapTypeArguments: empty string failed"
    ) 
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
 
    let wrong = "wrong"
    XCTAssertNil(MapType.create(from: wrong)) 
    
  }


}

