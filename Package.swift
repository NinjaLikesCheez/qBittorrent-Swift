// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "QBittorrent",
  platforms: [
    .iOS(.v18),
    .tvOS(.v18),
    .macOS(.v15),
  ],
  products: [
    .library(name: "QBittorrent", targets: ["QBittorrent"])
  ],
  dependencies: [
    .package(url: "https://github.com/NinjaLikesCheez/swift-api-client", from: "0.0.1"),
    .package(url: "https://github.com/apple/swift-log", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "QBittorrent",
      dependencies: [
        .product(name: "APIClient", package: "swift-api-client"),
        .product(name: "Logging", package: "swift-log"),
      ]
    ),
    .testTarget(name: "QBittorrentIntegrationTests", dependencies: [.target(name: "QBittorrent")]),
  ]
)
