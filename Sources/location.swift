// Swiss Map Topo Location
// Demo-URL: https://map.geo.admin.ch/?swisssearch=46.62393833333333,8.46906333333333

// See Documentation: https://help.geo.admin.ch/?ids=54&lang=de

import Foundation

struct Location {
  let latitude: Double
  let longitude: Double

  init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
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



