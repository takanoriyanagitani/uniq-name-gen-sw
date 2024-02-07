// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "UniqNameGenDbFriendlyExample",
    dependencies: [
        .package(name: "UniqNameGenDbFriendly", path: "..")
    ],
    targets: [
        .executableTarget(
            name: "UniqNameGenDbFriendlyExample",
            dependencies: [
                "UniqNameGenDbFriendly"
            ],
            path: "Sources"
        )
    ]
)
