//
//  smap
//
//  Adelboden coordinate: CLLocationCoordinate2D(latitude: 46.49619, longitude: 7.5638251),
//

import Foundation
import ArgumentParser
import AppKit

@main
struct SmapApp: ParsableCommand {
    
    @Flag(name: .shortAndLong, help: "Show Location as Swiss Topo Map in Browser")
    var browser = false
    
    @Argument(help: "Image file path")
    var imageFilePath: String
    
    func validate() throws {
      if imageFilePath.isEmpty {
        throw ValidationError("Image file path cannot be empty.")
      }
    }

    mutating func run() throws  {

        let imageFileURL = URL(fileURLWithPath: imageFilePath)
        

        let location = Location.read(contentsOf: imageFileURL)
        // let location = Location(latitude: 46.49619, longitude: 7.5638251)
        let mapLink = location.mapURL
    
        if browser {
          NSWorkspace.shared.open(mapLink)
        } else {
          print("\"\(mapLink.absoluteString)\"")
        }
        
    }
    
}





/*
*/
