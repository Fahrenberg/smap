// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmapApp",
    dependencies: [
        .package(url:"https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "smap",
            dependencies: [
                .product(name:"ArgumentParser", package: "swift-argument-parser")
            ],
            exclude: [
                "lochberg.jpg",
                "smap.sh"
            ]
         ),
        .testTarget(
          name: "SmapTests",
          dependencies: [
            "smap"
            ],
          resources: [
            .process("testImage.jpg")
          ]
        ) 
    ]
)
