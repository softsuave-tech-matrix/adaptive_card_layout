// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "adaptive_card_layout",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "adaptive_card_layout",
            targets: ["adaptive_card_layout"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "adaptive_card_layout"),
        .testTarget(
            name: "adaptive_card_layoutTests",
            dependencies: ["adaptive_card_layout"]),
    ]
)
