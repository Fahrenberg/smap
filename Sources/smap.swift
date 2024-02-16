//
//  smap
//
//

import Foundation
import ArgumentParser
import AppKit

@main
struct Smap: ParsableCommand {
    
    @Flag(name: .shortAndLong, help: "Show Location as Swiss Topo Map in Browser")
    var browser = false
    
    @Argument(help: "Image file path")
    var imageFilePath: String
    
    mutating func run() throws  {

        let imageFileURL = URL(fileURLWithPath: imageFilePath)
        
        let imageData = try Data(contentsOf: imageFileURL)         
        let location = Location.read(from: imageData)
        // let location = Location(latitude: 46.49619, longitude: 7.5638251)
        let mapLink = location.mapURL
    
        if browser {
          NSWorkspace.shared.open(mapLink)
        } else {
          print(mapLink.absoluteString)
        }
        
    }
    
}





/*
ADELBODEN coordinate: CLLocationCoordinate2D(latitude: 46.49619, longitude: 7.5638251),
*/
