// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountryPicker-SwiftUI",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "CountryPicker-SwiftUI",
            targets: ["CountryPicker-SwiftUI"]),
    ],
    targets: [
        .target(
            name: "CountryPicker-SwiftUI",
            dependencies: [],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "CountryPicker-SwiftUITests",
            dependencies: ["CountryPicker-SwiftUI"]
        ),
    ]
)
