<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# NanoLinst
A Custom lints for better quality code

## Features
- Checking potentially null on dart model class
- Coming soon


## Getting started

- Add dependency on your `pubspec.yaml`
  
  ```yaml
  # add this on dev dependencies
  dev_dependencies:
    custom_lint: ^0.0.9+1
    nano_lints:
        path: ../nano_lints

  ```

- Add analyzer on `analysis_options.yaml`
  
  ```yaml
  analyzer:
    plugins:
        - custom_lint
  ```

## Usage

```dart
// BAD
data: Data.fromJson(json["data"]),

// GOOD
data: json["data"] == null
    ? null
    : DateTime.parse(json["data"]),
```

```dart
// BAD
 createdDate: DateTime.parse(json["createdDate"]),

// GOOD
createdDate: json["createdDate"] == null
    ? null
    : DateTime.parse(json["createdDate"]),
```

## Additional information

This package is still under development
