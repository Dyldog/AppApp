// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppAppKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppAppKit",
            targets: ["AppAppKit"]),
    ],
    dependencies: [
        .package(url: "../../DylKit", branch: "master"),
        .package(url: "../../Armstrong", branch: "main"),
        .package(url: "../../Alexandria", branch: "main"),
        .package(url: "../../Greg", branch: "main"),
        .package(url: "../../Obscura", branch: "main"),
        .package(url: "../../Viticci", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AppAppKit",
            dependencies: ["DylKit", "Armstrong", "Alexandria", "Greg", "Obscura", "Viticci"]
        ),
        .testTarget(
            name: "AppAppKitTests",
            dependencies: ["AppAppKit"]),
    ]
)
