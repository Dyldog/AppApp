// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Greg",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Greg",
            targets: ["Greg"]
        ),
    ],
    dependencies: [
        .package(path: "../DylKit"),
        .package(path: "../Armstrong"),
        .package(path: "../Alexandria"),
        .package(url: "https://github.com/krzysztofzablocki/Sourcery.git", from: "2.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Greg",
            dependencies: ["DylKit", "Armstrong", "Alexandria"]
        ),
        .testTarget(
            name: "GregTests",
            dependencies: ["Greg"]
        ),
    ]
)
