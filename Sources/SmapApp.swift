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
    
    @Option(name: .short, help: "Show Location in Browser: swiss = Swiss Topo, osm = Open Street Map, placeholder = Placeholder Image")
    var output: String = ""

    @Flag(name: .shortAndLong, help: "Show Location as Swiss Topo Map in Browser")
    var browser = false
    
    @Argument(help: "Image file path")
    var imageFilePath: String
    
    func validate() throws {
      if imageFilePath.isEmpty {
        throw ValidationError("Image file path cannot be empty.")
      }
      if !(MapType.valid(argument: output) || output.isEmpty) {
         throw ValidationError("Wrong Output Option: use -o=swiss or -o=osm or -o=placeholder.") 
      }
    }

    mutating func run() throws  {

        let mapType = MapType.create(from: output) ?? MapType.swiss

        let imageFileURL = URL(fileURLWithPath: imageFilePath)
        

        let location = Location.read(contentsOf: imageFileURL)
        let mapLink = mapType.createMap(for: location).mapURL()
    
        if browser {
          NSWorkspace.shared.open(mapLink)
        } else {
          print("\"\(mapLink.absoluteString)\"")
        }
        
    }
}





/*
*/
