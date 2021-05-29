import XCTest
import ChainSwift

enum MyEnum {
  case value1
  case value2
}

class MyClass {
  var text = ""
  var int = 0
  var myEnum: MyEnum = .value1
}

struct MyStruct {
  var text = ""
  var int = 0
  var myEnum: MyEnum = .value1
}

extension MyClass: Chainable { }
extension MyStruct: Chainable { }


/// Ensure compiles with NSObject
import Foundation
extension NSObject: Chainable { }

final class ChainSwiftTests: XCTestCase {
  func testClassWorks() {
    let myClass = MyClass()
    
    XCTAssertEqual(myClass.text, "")
    XCTAssertEqual(myClass.int, 0)
    XCTAssertEqual(myClass.myEnum, .value1)
    
    myClass.ch
      .text("It works")
      .int(99)
      .myEnum(.value2)
    
    XCTAssertEqual(myClass.text, "It works")
    XCTAssertEqual(myClass.int, 99)
    XCTAssertEqual(myClass.myEnum, .value2)
  }
  
  func testTakingChValueWorks() {
    let myClass = MyClass().ch
      .text("It works")
      .int(99)
      .myEnum(.value2)
      .ch
    
    XCTAssertEqual(myClass.text, "It works")
    XCTAssertEqual(myClass.int, 99)
    XCTAssertEqual(myClass.myEnum, .value2)
  }
  
  func testStructWorks() {
    let myStruct = MyStruct()
    
    XCTAssertEqual(myStruct.text, "")
    XCTAssertEqual(myStruct.int, 0)
    XCTAssertEqual(myStruct.myEnum, .value1)
    
    let updatedMyStruct = myStruct.ch
      .text("It works")
      .int(99)
      .myEnum(.value2)
      .ch

    XCTAssertEqual(myStruct.text, "")
    XCTAssertEqual(myStruct.int, 0)
    XCTAssertEqual(myStruct.myEnum, .value1)
    
    XCTAssertEqual(updatedMyStruct.text, "It works")
    XCTAssertEqual(updatedMyStruct.int, 99)
    XCTAssertEqual(updatedMyStruct.myEnum, .value2)
  }
  
  static var allTests = [
    ("testClassWorks", testClassWorks),
    ("testTakingChValueWorks", testTakingChValueWorks),
    ("testStructWorks", testStructWorks),
  ]
}
