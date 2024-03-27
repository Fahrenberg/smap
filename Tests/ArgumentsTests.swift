import XCTest
@testable import smap
class ArgumentsTests: XCTestCase {

  func testOutputArguments() {
    let empty = ""
    XCTAssertTrue(Arguments.validOutputArgument(argument: empty), 
      "testOutputArgument: sempty string failed"
    ) 
    let osm = "osm"
    XCTAssertTrue(Arguments.validOutputArgument(argument: osm),
       "testOutputArgument: osm string failed"   
    ) 
    let swiss = "swiss"
    XCTAssertTrue(Arguments.validOutputArgument(argument: swiss), 
       "testOutputArgument: swiss string failed"   
    ) 
 
    let wrong = "wrong"
    XCTAssertFalse(Arguments.validOutputArgument(argument: wrong)) 
    
  }

  func testValidFileName() {
    let filename = ""
    XCTAssertFalse(Arguments.validFilename(argument: filename),
      "testValidFilename: missing filename"
    )
    let lochberg = "lochberg.jpg"
    XCTAssertTrue(Arguments.validFilename(argument: lochberg),
      "testValidFilename: missing filename \(lochberg)"
    )
 
  }
  
  func testConvertOption() {
  }
}

