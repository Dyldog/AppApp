// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppAppKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppAppKit",
            targets: ["AppAppKit"]
        ),
    ],
    dependencies: [
        .package(url: "../../DylKit", branch: "master"),
        .package(path: "../Frameworks/Armstrong"),
        .package(path: "../Frameworks/Alexandria"),
        .package(path: "../Frameworks/Greg"),
        .package(path: "../Frameworks/Obscura"),
        .package(path: "../Frameworks/Viticci"),
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
            dependencies: ["AppAppKit"]
        ),
    ]
)
