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
    
    @Option(name: .short, help: "Show Location in Browser: swiss = Swiss Topo, osm = Open Street Map")
    var output: String = ""

    @Flag(name: .shortAndLong, help: "Show Location as Swiss Topo Map in Browser")
    var browser = false
    
    @Argument(help: "Image file path")
    var imageFilePath: String
    
    func validate() throws {
      if !ArgumentsValidator.validFilename(argument: imageFilePath) {
        throw ValidationError("Image file path cannot be empty.")
      }
      if !ArgumentsValidator.validOutputArgument(argument: output) {
         throw ValidationError("Wrong Output Option: use -o=swiss or -o=osm.")      
      }
    }

    mutating func run() throws  {

        print("Option o = \(output)")
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
   

    func validOutputOption(output: String) -> Bool {
        return false 
    }
}





/*
*/
