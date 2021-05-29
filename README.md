[![License](https://img.shields.io/github/license/OrkhanAlikhanov/ChainSwift.svg)](https://github.com/OrkhanAlikhanov/ChainSwift/blob/master/LICENSE)

# ChainSwift 🔗
`ChainSwift` is an extension that provides chainable way of setting properties in swift.

## Why?
You can do this:
```swift
let titleLabel = UILabel().set
  .text("Welcome")
  .font(.systemFont(ofSize: 20))
  .textAlignment(.center)
  .get
```
Instead of this:
```swift
let titleLabel = UILabel()
titleLabel.text("Welcome")
titleLabel.font(.systemFont(ofSize: 20))
titleLabel.textAlignment(.center)
```

## Usage
After installing add these lines to anywhere in your code:

```swift
import Foundation
import ChainSwift

extension NSObject: Chainable { } /// covers anything inheriting NSObject like UIView
```

## Examples
Consider following class
```swift
class MyClass {
  var text = ""
  var int = 0
  var myEnum: MyEnum = .value1
}
```

After adding this single line: 
```swift
extension MyClass: Chainable { }
```

You will be able to do:
```swift
let myClass = MyClass()

myClass.set
  .text("It works")
  .int(99)
  .myEnum(.value2)

print(myClass.text) // "It works"
print(myClass.int) // 99
print(myClass.myEnum) // .value2

/// immediate usage
let myClass = MyClass().set
  .text("It works")
  .int(99)
  .myEnum(.value2)
  .get // gains the instance back
```

## How it works?
It combines Swift's [Key Path Member Lookup](https://github.com/apple/swift-evolution/blob/main/proposals/0252-keypath-dynamic-member-lookup.md) and [`func callAsFunction`](https://github.com/apple/swift-evolution/blob/main/proposals/0253-callable.md) features to achive this. 

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Socket.swift does support its use on supported platforms. 

Once you have your Swift package set up, adding Socket.swift as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
  .package(url: "https://github.com/OrkhanAlikhanov/ChainSwift.git", .upToNextMajor(from: "1.0.0"))
]
```

### Manually
Just drag and drop the files in the [Sources](https://github.com/OrkhanAlikhanov/ChainSwift/blob/master/Sources) folder.

## Authors

* **Orkhan Alikhanov** - *Initial work* - [OrkhanAlikhanov](https://github.com/OrkhanAlikhanov)

See also the list of [contributors](https://github.com/OrkhanAlikhanov/ChainSwift/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/OrkhanAlikhanov/ChainSwift/blob/master/LICENSE) file for details
