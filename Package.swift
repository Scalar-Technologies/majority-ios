// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Majority",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Majority",
            targets: ["Majority"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Majority",
            dependencies: []
        ),
        .testTarget(
            name: "MajorityTests",
            dependencies: ["Majority"]
        )
    ]
)
