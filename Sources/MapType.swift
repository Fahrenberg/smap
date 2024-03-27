// MapType - convert Location into a Map URL
//
//
// Strategy Pattern to build URL based on MapType (= strategy)
//
// https://refactoring.guru/design-patterns/strategy
//

import Foundation

enum MapType {
  case swiss
  case osm
  case placeholder

  func createMap(for location: Location) -> Maps {
    switch self {
      case .swiss:
        return SwissMap(location: location)
      case .osm:
        return OsmMap(location: location)
      case .placeholder:
        return PlaceholderMap(location: location)
    }
  }

}
extension MapType {
   
}

protocol Maps {
  var location: Location { get }
  func mapURL() -> URL
}


fileprivate struct SwissMap: Maps {
  let location: Location

  private let urlMapSwissTopoBase = URL(string: "https://map.geo.admin.ch/")!    

  func mapURL() -> URL {
      var swissTopoComponent = URLComponents(url: urlMapSwissTopoBase,
                                             resolvingAgainstBaseURL: false)!
      let coordinateString = location.coordinateString
      swissTopoComponent.queryItems = [URLQueryItem(name: "swisssearch", value: coordinateString)]
      return swissTopoComponent.url!
  }
}

fileprivate struct OsmMap: Maps {
  let location: Location
  private let urlOsmBase = URL(string: "https://www.openstreetmap.org/")!    

  func mapURL() -> URL {
      var osmComponent = URLComponents(url: urlOsmBase,
                                               resolvingAgainstBaseURL: false)!
     let mlat: String = String(location.latitude)
      let mlon: String = String(location.longitude)
      let map: String = "18/\(mlat)/\(mlon)"
      let layers: String = "Y"
      osmComponent.queryItems = [
          URLQueryItem(name: "mlat", value: mlat),
          URLQueryItem(name: "mlon", value: mlon),
          URLQueryItem(name: "map", value: map),
          URLQueryItem(name: "layers", value: layers)
        ]
        
    return osmComponent.url!
  }
}


fileprivate struct PlaceholderMap: Maps {
  let location: Location

  let ulrPlaceholderBase = URL(string: "https://placehold.co/600x400")!

  func mapURL() -> URL {
    var placeholderComponent = URLComponents(url: ulrPlaceholderBase,
                                                resolvingAgainstBaseURL: false)!
    let lat: String = String(location.latitude)
    let lon: String = String(location.longitude)
 
    let text = "Map\\nLat=\(lat)\\nLon=\(lon)"
    placeholderComponent.queryItems = [ URLQueryItem(name: "text", value: text) ]
    return placeholderComponent.url!
  }
}
