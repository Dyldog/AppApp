// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Viticci",
    platforms: [
        .iOS(.v15),
        .macOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Viticci",
            targets: ["Viticci"]
        ),
    ],
    dependencies: [
        .package(url: "../DylKit", branch: "master"),
        .package(path: "../Armstrong"),
        .package(path: "../Alexandria"),
        .package(url: "https://github.com/krzysztofzablocki/Sourcery.git", from: "2.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Viticci",
            dependencies: ["DylKit", "Armstrong", "Alexandria"]
        ),
        .testTarget(
            name: "ViticciTests",
            dependencies: ["Viticci"]
        ),
    ]
)
