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
titleLabel.text = "Welcome"
titleLabel.font = .systemFont(ofSize: 20)
titleLabel.textAlignment = .center
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

## Other works
- [LayoutSwift](https://github.com/OrkhanAlikhanov/LayoutSwift) - Yet another Swift Autolayout DSL for iOS.
- [SwiftUIRouter](https://github.com/OrkhanAlikhanov/SwiftUIRouter) - An experimental navigation router for SwiftUI.

## Installation

### Swift Package Manager

_Note: Instructions below are for using **SwiftPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add ChainSwift from there._

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/) , without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/OrkhanAlikhanov/ChainSwift.git", .upToNextMajor(from: "1.0.1"))
]
```
and then specify `"ChainSwift"` as a dependency of the Target in which you wish to use ChainSwift.

### Manually
Just drag and drop the files in the [Sources](https://github.com/OrkhanAlikhanov/ChainSwift/blob/master/Sources) folder.

## Authors
* **Orkhan Alikhanov** - *Initial work* - [OrkhanAlikhanov](https://github.com/OrkhanAlikhanov)

See also the list of [contributors](https://github.com/OrkhanAlikhanov/ChainSwift/contributors) who participated in this project.

## Love our work?
Hit the star 🌟 button! It helps! ❤️

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/OrkhanAlikhanov/ChainSwift/blob/master/LICENSE) file for details
