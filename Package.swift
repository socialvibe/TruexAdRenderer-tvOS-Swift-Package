// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "TruexAdRenderer",
    platforms: [
        .tvOS(.v13)],
    products: [
        .library(
            name: "TruexAdRenderer",
            targets: ["TruexAdRendererTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Innovid/tvos-xcframework.git", .upToNextMinor(from: "1.7.40")),
    ],
    targets: [
        .binaryTarget(name: "TruexAdRenderer",
                      url: "https://stash.truex.com/integration/TruexAdRenderer-tvOS-v3.15.3-spm.zip",
                      checksum: "80f0972ffa1f4db71dae3a609b65d6d077b4bca94e47bfc8c5a7505e7a85b067"),
        .target(name: "TruexAdRendererTarget",
               dependencies: [
                .target(name: "TruexAdRenderer"),
                .product(name: "InnovidAdRendererFramework", package: "tvos-xcframework"),
               ])
    ]
)
