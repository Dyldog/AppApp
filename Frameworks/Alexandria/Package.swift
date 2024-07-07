// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Alexandria",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Alexandria",
            targets: ["Alexandria"]
        ),
    ],
    dependencies: [
        .package(url: "../DylKit", branch: "master"),
        .package(path: "../Armstrong"),
        .package(url: "https://github.com/0x0001SUI/TextView.git", .upToNextMajor(from: "1.1.0")),
        .package(url: "https://github.com/krzysztofzablocki/Sourcery.git", from: "2.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Alexandria",
            dependencies: ["DylKit", "Armstrong", "TextView"]
        ),
        .testTarget(
            name: "AlexandriaTests",
            dependencies: ["Alexandria"]
        ),
    ]
)
