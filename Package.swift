import PackageDescription

let package = Package(
    name: "AdventOfCode",
    targets: [],
    dependencies: [
      .Package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", majorVersion: 0),
      .Package(url: "https://github.com/antitypical/Result.git",
                 majorVersion: 3),
      .Package(url: "https://github.com/crossroadlabs/Regex.git", Version("1.0.0-alpha.1")!),
    ]
)
