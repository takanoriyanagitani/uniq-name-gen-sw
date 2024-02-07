// swift-tools-version:5.9

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
        )
    ]
)
