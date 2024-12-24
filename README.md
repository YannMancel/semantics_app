[![badge_flutter]][link_flutter_release]
[![badge_linter]][dependency_flutter_lints]

# semantics_app

**Goal**: A Flutter project to manage semantics.

## Getting Started

### Prerequisites

* [fvm][dependency_fvm]
* [maestro][dependency_maestro]

### Setup

```bash
git clone git@github.com:YannMancel/semantics_app.git
make install
make dependencies
```

## Dependencies

* Linter
  * [flutter_lints][dependency_flutter_lints]
* Tests
  * [mocktail][dependency_mocktail]
  * [integration_test][dependency_integration_test]

## Troubleshooting

### No device available during the compilation and execution steps

* If none of device is present (*Available Virtual Devices* or *Connected Devices*),
  * Either select `Create a new virtual device`
  * or connect and select your phone or tablet

## Useful

* [Download Android Studio][useful_android_studio]
* [Create a new virtual device][useful_virtual_device]
* [Enable developer options and debugging][useful_developer_options]

[badge_flutter]: https://img.shields.io/badge/flutter-v3.24.3-blue?logo=flutter
[badge_linter]: https://img.shields.io/badge/style-flutter__lints-4BC0F5.svg
[link_flutter_release]: https://docs.flutter.dev/development/tools/sdk/releases
[dependency_fvm]: https://fvm.app/
[dependency_maestro]: https://maestro.mobile.dev/
[dependency_flutter_lints]: https://pub.dev/packages/flutter_lints
[dependency_mocktail]: https://pub.dev/packages/mocktail
[dependency_integration_test]: https://pub.dev/packages/integration_test
[useful_android_studio]: https://developer.android.com/studio
[useful_virtual_device]: https://developer.android.com/studio/run/managing-avds.html
[useful_developer_options]: https://developer.android.com/studio/debug/dev-options.html#enable
