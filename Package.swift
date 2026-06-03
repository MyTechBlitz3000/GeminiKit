// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PersistenceAI",

    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10)
    ],

    products: [
        .library(
            name: "PersistenceAI",
            targets: ["PersistenceAI"]
        ),

        .executable(
            name: "persistence-cli",
            targets: ["App"]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            from: "1.3.0"
        ),

        .package(
            url: "https://github.com/apple/swift-docc-plugin",
            from: "1.3.0"
        )
    ],

    targets: [

        .target(
            name: "PersistenceAI",
            dependencies: [],
            path: "Sources/PersistenceAI"
        ),

        .executableTarget(
            name: "App",
            dependencies: [
                "PersistenceAI",

                .product(
                    name: "ArgumentParser",
                    package: "swift-argument-parser"
                )
            ],
            path: "Sources/App",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile")
            ]
        ),

        .testTarget(
            name: "PersistenceAITests",
            dependencies: ["PersistenceAI"]
        )
    ]
)
