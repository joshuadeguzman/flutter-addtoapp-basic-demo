# Flutter Add-to-App Basic Demo
by [Joshua M. de Guzman](https://jdg.ph)

A demonstrable flutter integration into an existing codebase, with the help of platform channels.

> DISCLAIMER: Since Flutter's "Add-to-App" functionality is in preview, the associated APIs and tooling are not stable and are subject to change.

### About

This repo demonstrate 2 possible use cases on how you can add your Flutter views in your existing codebase:
* View Embedding
* Entire Screen

### Resources

Some docs and blog that you will need to continue your journey in maximizing Flutter Add-to-App feature.
- [Flutter Add-to-App docs](https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps)
- [Flutter Add-to-App project board](http://github.com/flutter/flutter/projects/28)
- [Flutter Platform Channels docs](https://flutter.dev/docs/development/platform-integration/platform-channels)
- [Platform Channels Blog](https://medium.com/flutter/flutter-platform-channels-ce7f540a104e)

Another project I wrote where I introduced Google Protobuf for serializing the platform channels data.
- [Flutter Add To Native](https://github.com/joshuadeguzman/flutter-examples/tree/master/flutter-add-to-native)

### Project

#### 1. Setup

a. Setup Flutter

```bash
$ flutter channel master
$ flutter upgrade
$ flutter packages get
```

b. Setup Android

```bash
$ cd flutter
$ flutter build apk
$ cd .. && cd android
$ ./gradlew installDebug
```

c. Setup iOS

```bash
$ cd flutter
$ flutter build ios
$ cd .. && cd ios
$ pod install
$ open gdgph_devfest_ios.xcworkspace
```

#### 2. Run

Attach (Running alongside native platform)

```bash
$ flutter attach
```

Debug

```bash
$ flutter run --verbose
```

Release

```bash
$ flutter run --verbose --release
```

Profile

```bash
$ flutter run --verbose --profile
```

#### 3. Tests

```bash
$ flutter run test/<TEST_FILE.dart>
```

#### 4. Technical Specs

Available channels

|Name|Type|
|---|---|
| `channel-username`          | `MethodChannel`               |
| `channel-embedded-messages` | `BasicMessageChannel<String>` |


Available routes

|Name|Widget|Description|
|---|---|---|
|`/flutter-screen`|`FlutterScreen`|Shows a full screen Flutter view. Presented as an `Activity` or `ViewController` in Android and iOS respectively.|
|`/flutter-embedded-view`|`FlutterEmbeddedView`|Shows a particular section of the app in Flutter.|

### Support

I would highly appreciate if we connect on Twitter or Github, and discuss Fluttery things over a cup of coffee ☕.
* Twitter: [@joshuamdeguzman](https://twitter.com/joshuamdeguzman)
* Github: [@joshuadeguzman](https://github.com/joshuadeguzman)

### Contact

* Email: [contact@jdg.ph](mailto:contact@jdg.ph)
* Telegram: [@joshuadeguzman](t.me/joshuadeguzman)

### License

flutter-addtoapp-basic-demo is released under the BSD-3 Clause License. See [LICENSE](https://github.com/joshuadeguzman/flutter-addtoapp-basic-demo/blob/master/LICENSE) for details.
