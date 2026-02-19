// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let package = Package(
    name: "TensorFlowLite",
    platforms: [
        .iOS(.v12),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "TensorFlowLite",
            targets: ["TensorFlowLite"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "TensorFlowLiteC",
            url: "https://github.com/readdle/tensorflow-lite-swift/releases/download/2.16.1/TensorFlowLiteC-2.16.1.xcframework.zip",
            checksum: "c3d00a89a97999510ce9acee5063a847dc9b6fbf3353ae97d50bb8f94270a6bf"
        ),
        .target(
            name: "TensorFlowLite",
            dependencies: ["TensorFlowLiteC"],
            linkerSettings: [
                .linkedLibrary("tensorflowlite_jni", .when(platforms: [.android]))
            ]
        ),
        .testTarget(
            name: "TensorFlowLiteTests",
            dependencies: ["TensorFlowLite"])
    ]
)
