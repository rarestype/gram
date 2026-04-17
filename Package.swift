// swift-tools-version:6.0
import PackageDescription

let package: Package = .init(
    name: "gram",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "Grammar", targets: ["Grammar"]),
        .library(name: "TestableErrors", targets: ["TestableErrors"]),
        .library(name: "TraceableErrors", targets: ["TraceableErrors"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ordo-one/dollup", from: "1.0.1"),
    ],
    targets: [
        .target(
            name: "Grammar",
            dependencies: [
                .target(name: "TraceableErrors"),
            ]
        ),

        .target(name: "TestableErrors"),
        .target(
            name: "TraceableErrors",
            dependencies: [
                .target(name: "TestableErrors"),
            ]
        ),
        .testTarget(
            name: "TraceableErrorsTests",
            dependencies: [
                .target(name: "TraceableErrors"),
            ]
        ),
    ]
)
for target: Target in package.targets {
    {
        var settings: [SwiftSetting] = $0 ?? []

        settings.append(.enableUpcomingFeature("ExistentialAny"))
        settings.append(.enableUpcomingFeature("InternalImportsByDefault"))
        settings.append(.enableExperimentalFeature("StrictConcurrency"))
        settings.append(.define("DEBUG", .when(configuration: .debug)))

        $0 = settings
    } (&target.swiftSettings)
}
