<div align="center">

🍫 &nbsp; **gram** &nbsp; 🍫

high-performance constructive parsing, in pure swift

[documentation and api reference](https://swiftinit.org/docs/gram/grammar)

</div>


## Requirements

The `gram` library requires Swift 6.0 or later.

<!-- DO NOT EDIT BELOW! AUTOSYNC CONTENT [STATUS TABLE] -->
| Platform | Status |
| -------- | ------ |
| 💬 Documentation | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Documentation/_all/status.svg)](https://github.com/rarestype/gram/actions/workflows/Documentation.yml) |
|  | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Documentation/Linux/status.svg)](https://github.com/rarestype/gram/actions/workflows/Documentation.yml) |
|  | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Documentation/macOS/status.svg)](https://github.com/rarestype/gram/actions/workflows/Documentation.yml) |
| 🐧 Linux | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Tests/Linux/status.svg)](https://github.com/rarestype/gram/actions/workflows/Tests.yml) |
| 🍏 Darwin | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Tests/macOS/status.svg)](https://github.com/rarestype/gram/actions/workflows/Tests.yml) |
| 🍏 Darwin (iOS) | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Tests/iOS/status.svg)](https://github.com/rarestype/gram/actions/workflows/Tests.yml) |
| 🍏 Darwin (tvOS) | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Tests/tvOS/status.svg)](https://github.com/rarestype/gram/actions/workflows/Tests.yml) |
| 🍏 Darwin (visionOS) | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Tests/visionOS/status.svg)](https://github.com/rarestype/gram/actions/workflows/Tests.yml) |
| 🍏 Darwin (watchOS) | [![Status](https://raw.githubusercontent.com/rarestype/gram/refs/badges/ci/Tests/watchOS/status.svg)](https://github.com/rarestype/gram/actions/workflows/Tests.yml) |
<!-- DO NOT EDIT ABOVE! AUTOSYNC CONTENT [STATUS TABLE] -->

## Adding `gram` as a dependency

To use `gram` in a project, add the following to your `Package.swift` file:

```swift
let package: Package = .init(
    ...
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/rarestype/gram", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "example",
            dependencies: [
                .product(name: "Grammar", package: "gram"),
                // other dependencies
            ]
        ),
        // other targets
    ]
)
```
