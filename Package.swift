// swift-tools-version: 5.8

import PackageDescription

var globalSwiftSettings: [PackageDescription.SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency"),
]

let package = Package(
    name: "CRDT",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(
            name: "CRDT",
            targets: ["CRDT"]
        ),
        .executable(name: "crdt-benchmark", targets: ["crdt-benchmark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.1"),
    ],
    targets: [
        .target(
            name: "CRDT",
            dependencies: [],
            swiftSettings: globalSwiftSettings
        ),
        .testTarget(
            name: "CRDTTests",
            dependencies: ["CRDT"]
        ),
        .executableTarget(
            name: "crdt-benchmark",
            dependencies: [
                "CRDT",
                .product(name: "CollectionsBenchmark", package: "swift-collections-benchmark"),
            ]
        ),
    ]
)
