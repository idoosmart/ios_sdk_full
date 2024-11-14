// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let pkgName = "IDOSDK-full"
let package = Package(
    name: pkgName,
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: pkgName,
            targets: [pkgName]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .target(
            name: pkgName,
            dependencies: ["App",
                           "flutter_bluetooth",
                           "Flutter",
                           "FlutterPluginRegistrant",
                           "native_channel",
                           "protocol_channel",
                           "IDOUtils",
                           "protocol_c"],
            path: pkgName,
            resources: [
                .process("icon_assets.bundle")
            ],
            cSettings: [
                .define("PLATFORM_TYPE=2"),
                .define("HAVE_INTTYPES_H"),
                .define("HAVE_PKCRYPT"),
                .define("HAVE_STDINT_H"),
                .define("HAVE_WZAES"),
                .define("HAVE_ZLIB"),
                .define("VAR_ARRAYS"),
                .define("USE_ALLOCA"),
                .define("NONTHREADSAFE_PSEUDOSTACK"),
                .define("OPUS_BUILD"),
                .define("STDC_HEADERS")
            ],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("iconv"),
                .linkedLibrary("c++"),
            ]
        ),
        .binaryTarget(
            name: "IDOUtils",
            path: "./IDOSDK-full/libs/IDOUtils.xcframework"
        ),
        .binaryTarget(
            name: "protocol_c",
            path: "./IDOSDK-full/libs/protocol_c.xcframework"
        ),
        .binaryTarget(
            name: "App",
            path: "./IDOSDK-full/libs/App.xcframework"
        ),
        .binaryTarget(
            name: "flutter_bluetooth",
            path: "./IDOSDK-full/libs/flutter_bluetooth.xcframework"
        ),
        .binaryTarget(
            name: "Flutter",
            path: "./IDOSDK-full/libs/Flutter.xcframework"
        ),
        .binaryTarget(
            name: "FlutterPluginRegistrant",
            path: "./IDOSDK-full/libs/FlutterPluginRegistrant.xcframework"
        ),
        .binaryTarget(
            name: "native_channel",
            path: "./IDOSDK-full/libs/native_channel.xcframework"
        ),
        .binaryTarget(
            name: "protocol_channel",
            path: "./IDOSDK-full/libs/protocol_channel.xcframework"
        ),
    ]
)
