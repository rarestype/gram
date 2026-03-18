<div align="center">

🌚 &nbsp; **gram** &nbsp; 🌝

high-performance constructive parsing, in pure swift

[documentation and api reference](https://swiftinit.org/docs/gram/grammar)

</div>


## Requirements

The `gram` library requires Swift 5.8 or later.

| Platform | Status |
| -------- | ------ |
| 💬 Documentation | [![Documentation](https://github.com/rarestype/gram/actions/workflows/Documentation.yml/badge.svg)](https://github.com/rarestype/gram/actions/workflows/Documentation.yml) |
| 🐧 Linux | [![Tests](https://github.com/rarestype/gram/actions/workflows/Tests.yml/badge.svg)](https://github.com/rarestype/gram/actions/workflows/Tests.yml) |
| 🍏 Darwin | [![Tests](https://github.com/rarestype/gram/actions/workflows/Tests.yml/badge.svg)](https://github.com/rarestype/gram/actions/workflows/Tests.yml) |
| 🍏 Darwin (iOS) | [![iOS](https://github.com/rarestype/gram/actions/workflows/iOS.yml/badge.svg)](https://github.com/rarestype/gram/actions/workflows/iOS.yml) |
| 🍏 Darwin (tvOS) | [![tvOS](https://github.com/rarestype/gram/actions/workflows/tvOS.yml/badge.svg)](https://github.com/rarestype/gram/actions/workflows/tvOS.yml) |
| 🍏 Darwin (visionOS) | [![visionOS](https://github.com/rarestype/gram/actions/workflows/visionOS.yml/badge.svg)](https://github.com/rarestype/gram/actions/workflows/visionOS.yml) |
| 🍏 Darwin (watchOS) | [![watchOS](https://github.com/rarestype/gram/actions/workflows/watchOS.yml/badge.svg)](https://github.com/rarestype/gram/actions/workflows/watchOS.yml) |


## Adding `gram` as a dependency

To use `gram` in a project, add the following to your `Package.swift` file:

```swift
let package: Package = .init(
    ...
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/rarestype/gram", from: "1.0.0"),
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
