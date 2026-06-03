// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "GeminiKit",

    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],

    products: [
        .library(
            name: "GeminiKit",
            targets: ["GeminiKit"]
        ),

        .executable(
            name: "gemini-cli",
            targets: ["GeminiApp"]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            from: "1.3.0"
        )
    ],

    targets: [

        // Core SDK
        .target(
            name: "GeminiKit",
            path: "Sources/GeminiKit"
        ),

        // Executable entry point
        .executableTarget(
            name: "GeminiApp",
            dependencies: [
                "GeminiKit",
                .product(
                    name: "ArgumentParser",
                    package: "swift-argument-parser"
                )
            ],
            path: "Sources/GeminiKit/App"
        )
    ]
)
