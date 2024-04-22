// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iTriangle",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iTriangle",
            targets: ["iTriangle"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/iShape-Swift/iFixFloat", .upToNextMajor(from: "1.7.0")),
        .package(url: "https://github.com/iShape-Swift/iShape", .upToNextMajor(from: "1.11.0")),
        .package(url: "https://github.com/iShape-Swift/iOverlay", .upToNextMajor(from: "1.15.0"))
//         .package(path: "../iFixFloat"),
//         .package(path: "../iShape"),
//         .package(path: "../iOverlay")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "iTriangle",
            dependencies: ["iFixFloat", "iShape", "iOverlay"]),
        .testTarget(
            name: "iTriangleTests",
            dependencies: ["iTriangle"],
            resources: [
                .process("Triangulation")
            ]
        ),
    ]
)
