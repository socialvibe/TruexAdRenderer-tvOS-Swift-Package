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
                      url: "https://stash.truex.com/integration/TruexAdRenderer-tvOS-v3.15.1-spm.zip",
                      checksum: "0533aa88075216668ab7f218ab0e322cc5f8c2cb3d9b2243e562b2dfe571c36f"),
        .target(name: "TruexAdRendererTarget",
               dependencies: [
                .target(name: "TruexAdRenderer"),
                .product(name: "InnovidAdRendererFramework", package: "tvos-xcframework"),
                .product(name: "SDWebImage", package: "SDWebImage"),
               ])
    ]
)
