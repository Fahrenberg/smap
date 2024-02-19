// Swiss Map Topo Location
// Demo-URL: https://map.geo.admin.ch/?swisssearch=7.5638251,46.49619
// See Documentation: https://help.geo.admin.ch/?ids=54&lang=de

import Foundation

struct Location {
  let latitude: Double
  let longitude: Double

  init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }


  var mapURL: URL {
      var swissTopoComponent = URLComponents(url: Location.urlMapSwissTopo,
                                             resolvingAgainstBaseURL: false)
      let coordinateString = self.coordinateString
      swissTopoComponent?.queryItems = [URLQueryItem(name: "swisssearch", value: coordinateString)]
      return swissTopoComponent?.url ?? Location.urlPlaceholder!
   }

  var coordinateString: String {
    return "\(self.latitude),\(self.longitude)"
  }
  
  static func read(contentsOf imageURL: URL) -> Location {
    let imageMetadata = ImageMetadata(for: imageURL)
    guard let latitude = imageMetadata.latitude(), 
          let longitude = imageMetadata.longitude()
    else { return Location(latitude: 0.0, longitude: 0.0) }
    return Location(latitude:latitude, longitude:longitude)
  }
}

extension Location {
   fileprivate static let urlPlaceholder = URL(string: "https://via.placeholder.com/640x640.png?text=SwissTopo+Map+Link")
   fileprivate static let urlMapSwissTopo = URL(string: "https://map.geo.admin.ch/")!   
}



// Test
/*
 var coordinate: CLLocationCoordinate2D { get throws {
        guard let gpsMetaData = self.metaData[kCGImagePropertyGPSDictionary] as? MetaData
        else { throw MetaDataError.NoGPSTag }
        
        guard let lat = gpsMetaData[kCGImagePropertyGPSLatitude] as? CLLocationDegrees,
              let latRef = gpsMetaData[kCGImagePropertyGPSLatitudeRef] as? GeoPosition,
              let lng = gpsMetaData[kCGImagePropertyGPSLongitude] as? CLLocationDegrees,
              let lngRef = gpsMetaData[kCGImagePropertyGPSLongitudeRef] as? GeoPosition
        else { throw MetaDataError.noCoordinate }
        
        let wgs84 =  "\(lat)\(CoordinateAccents.degreeAccent.rawValue)\(latRef) \(lng)\(CoordinateAccents.degreeAccent.rawValue)\(lngRef)"
        guard let parsedCoordinate = wgs84.parseToCoordinate2D
        else { throw MetaDataError.noCoordinate }
        return parsedCoordinate
    } }
    
*/

