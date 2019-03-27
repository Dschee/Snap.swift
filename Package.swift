// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Snap",
    // platforms: [.iOS("9.0"), tvOS("10.0")],
    products: [
        .library(name: "Snap", targets: ["Snap"])
    ],
    targets: [
        .target(
            name: "Snap",
            path: "Snap"
        )
    ]
)
