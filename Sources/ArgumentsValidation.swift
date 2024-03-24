// Argments validator

struct ArgumentsValidator {

  static func validOutputArgument(argument: String) -> Bool {
      switch argument {
      case "","osm","swiss":
        return true
      default:
        return false
      }
  }
  static func validFilename(argument: String) -> Bool {
    return !argument.isEmpty

  }
}
