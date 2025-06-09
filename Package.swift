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
        .package(url:"https://github.com/Innovid/tvos-xcframework.git", exact: "1.7.10"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git" , exact: "5.19.2"),
    ],
    targets: [
        .binaryTarget(name: "TruexAdRenderer",
                      url: "https://stash.truex.com/integration/TruexAdRenderer-tvOS-v3.15.2-spm.zip",
                      checksum: "bc51d0054f3980e232c00f0c3cba4489305539904bb3746a50d48efc0ce833b4"),
        .target(name: "TruexAdRendererTarget",
               dependencies: [
                .target(name: "TruexAdRenderer"),
                .product(name: "InnovidAdRendererFramework", package: "tvos-xcframework"),
                .product(name: "SDWebImage", package: "SDWebImage"),
               ])
    ]
)
