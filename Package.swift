// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "UniqNameGenDbFriendly",
    products: [
        .library(
            name: "UniqNameGenDbFriendly",
            targets: [
                "UniqNameGenDbFriendly"
            ]
        )
    ],
    targets: [
        .target(
            name: "UniqNameGenDbFriendly",
            path: "Sources"
        ),
        .testTarget(
            name: "UniqNameGenDbFriendlyTests",
            dependencies: ["UniqNameGenDbFriendly"]
        )
    ]
)
