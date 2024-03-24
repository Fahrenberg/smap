import XCTest
@testable import smap
class ArgumentsValidationTests: XCTestCase {

  func testOutputArguments() {
    let empty = ""
    XCTAssertTrue(ArgumentsValidator.validOutputArgument(argument: empty), 
      "testOutputArgument: sempty string failed"
    ) 
    let osm = "osm"
    XCTAssertTrue(ArgumentsValidator.validOutputArgument(argument: osm),
       "testOutputArgument: osm string failed"   
    ) 
    let swiss = "swiss"
    XCTAssertTrue(ArgumentsValidator.validOutputArgument(argument: swiss), 
       "testOutputArgument: swiss string failed"   
    ) 
 
    let wrong = "wrong"
    XCTAssertFalse(ArgumentsValidator.validOutputArgument(argument: wrong)) 
    
  }

  func testValidFileName() {
    let filename = ""
    XCTAssertFalse(ArgumentsValidator.validFilename(argument: filename),
      "testValidFilename: missing filename"
    )
    let lochberg = "lochberg.jpg"
    XCTAssertTrue(ArgumentsValidator.validFilename(argument: lochberg),
      "testValidFilename: missing filename \(lochberg)"
    )
 
  }
}

