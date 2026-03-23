<div align="center">

🍫 &nbsp; **gram** &nbsp; 🍫

high-performance constructive parsing, in pure swift

[documentation and api reference](https://swiftinit.org/docs/gram/grammar)

</div>


## Requirements

The `gram` library requires Swift 5.8 or later.

<!-- DO NOT EDIT BELOW! AUTOSYNC CONTENT [STATUS TABLE] -->
<!-- DO NOT EDIT ABOVE! AUTOSYNC CONTENT [STATUS TABLE] -->

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
