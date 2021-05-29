// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "ChainSwift",
  products: [
    .library(name: "ChainSwift", targets: ["ChainSwift"]),
  ],
  
  targets: [
    .target(name: "ChainSwift", dependencies: []),
    .testTarget(name: "ChainSwiftTests", dependencies: ["ChainSwift"]),
  ]
)
