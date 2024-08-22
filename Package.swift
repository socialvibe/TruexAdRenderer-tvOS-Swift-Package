// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TruexAdRenderer",
    platforms:[
        .tvOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TruexAdRenderer",
            targets: ["TruexAdRendererTarget"]),
    ],
    dependencies: [
        .package(url:"https://github.com/Innovid/tvos-xcframework.git", exact: "1.7.0"),
        .package(url:"https://github.com/pusher/pusher-websocket-swift.git", exact: "8.0.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git" , exact: "5.19.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "TruexAdRenderer",
                      url: "https://stash.truex.com/integration/TruexAdRenderer-tvOS-v3.12.0-spm.zip",
                      checksum: "9b4638179009e2a6fa9c3b9c89a5940da9be335b0cb1749e10b3523ff83b4c48"),
        .target(name: "TruexAdRendererTarget",
               dependencies: [
                .target(name: "TruexAdRenderer"),
                .product(name: "InnovidAdRendererFramework", package: "tvos-xcframework"),
                .product(name: "PusherSwift", package: "pusher-websocket-swift"),
                .product(name: "SDWebImage", package: "SDWebImage"),
               ])
    ]
)
