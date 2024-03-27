// Argments validator

struct Arguments {

  static func validOutputArgument(argument: String) -> Bool {
      switch argument {
      case "", "swiss":
        return true
      case "osm":
        return true
      case "placeholder":
        return true
      default:
        return false
      }
  }
  static func validFilename(argument: String) -> Bool {
    return !argument.isEmpty

  }
  static func convertOutputArgument(argument: String) -> MapType {
      switch argument {
      case "swiss":
        return MapType.swiss
      case "osm":
        return MapType.osm
      case "placeholder":
        return MapType.placeholder
      default:
        return MapType.swiss
      }
  }
 
}
