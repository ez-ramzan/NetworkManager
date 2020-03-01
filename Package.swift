// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "NetworkManager",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "NetworkManager", targets: ["NetworkManager"]),
    ],
    targets: [
        .target(
            name: "NetworkManager",
            path: "Sources"),
    ]
)
