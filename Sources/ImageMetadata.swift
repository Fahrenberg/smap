//
// Image Meta Data Reader
// pass in URL or Data to return image meta data
// see documention [Apple CGImageMetadata](https://developer.apple.com/documentation/imageio/cgimagemetadata)
// for specific GPS meta data see [GPS Dictionary Keys](https://developer.apple.com/documentation/imageio/gps_dictionary_keys)
//

import Foundation
import ImageIO

// edited in iVim
typealias Metadata = [CFString: Any]
struct ImageMetadata {
    private(set) var properties: Metadata? = nil 
    private var fileName: String

    init(for imageURL: URL) {
        self.fileName = imageURL.lastPathComponent

        guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, nil) else {
            return
        }

        guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? Metadata else {
            return
        }

        self.properties = properties
    }

    func debugDescription() {
      guard let properties = self.properties,
            let pixelWidth = properties[kCGImagePropertyPixelWidth], 
            let width = pixelWidth as? Int,
            let pixelHeight = properties[kCGImagePropertyPixelHeight], 
            let height = pixelHeight as? Int
 
      else {
           print(properties ?? "nil")
           print("ImageMetadata - no image size  found.")
           return
       } 

      print("ImageMetadata: \(self.fileName) dimensions in pixels (w x h):", width, "x", height)
    }
  
// use exiftool -a -G1 -s -n -ee '-gps*' xxx.jpg to check gps data
    func longitude() -> Double? {
       guard let properties = self.properties,
            let gpsProperties = properties[kCGImagePropertyGPSDictionary] as? Metadata,
            let gpsLongitude = gpsProperties[kCGImagePropertyGPSLongitude], 
            let longitude =  gpsLongitude  as? Double
 
      else {
           print(properties ?? "nil")
           print("ImageMetadata - no gps longitude found.")
           return nil 
       } 
       return longitude

    }

    func latitude() -> Double? {
      guard let properties = self.properties,
            let gpsProperties = properties[kCGImagePropertyGPSDictionary] as? Metadata,
            let gpsLatitude = gpsProperties[kCGImagePropertyGPSLatitude], 
            let latitude =  gpsLatitude  as? Double
 
      else {
           print(properties ?? "nil")
           print("ImageMetadata - no gps latitude found.")
           return nil 
       } 
       return latitude 
    }

}

/*
import ImageIO

func extractGPSData(from imageData: Data) -> CLLocationCoordinate2D? {
    guard let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil) else {
        print("Error creating image source")
        return nil
    }

    guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? [CFString: Any] else {
        print("Error getting image properties")
        return nil
    }

    if let gpsInfo = properties[kCGImagePropertyGPSDictionary] as? [CFString: Any],
       let latitude = gpsInfo[kCGImagePropertyGPSLatitude] as? CLLocationDegrees,
       let longitude = gpsInfo[kCGImagePropertyGPSLongitude] as? CLLocationDegrees {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return coordinate
    } else {
        print("GPS data not found in the image")
        return nil
    }
}

// Example usage
if let imageURL = Bundle.main.url(forResource: "example_image", withExtension: "jpg") {
    do {
        let imageData = try Data(contentsOf: imageURL)
        if let gpsData = extractGPSData(from: imageData) {
            print("Latitude: \(gpsData.latitude), Longitude: \(gpsData.longitude)")
        } else {
            print("Failed to extract GPS data from the image.")
        }
    } catch {
        print("Error loading image data: \(error)")
    }
} else {
    print("Image not found.")
}
*/
