# Devfest Flutter Integration
by [Joshua M. de Guzman](https://joshdeguzman.com)

A demonstrable flutter integration into an existing codebase, with the help of platform channels.

> DISCLAIMER: Since Flutter's "Add-to-App" functionality is in preview, the associated APIs and tooling are not stable and are subject to change.

### About

In this session, we will be discussing the how Flutter can be beneficial for your company or projects. I will also tackle the 2 use cases on how you can integrate Flutter into an existing mobile codebase. Lastly, I will share the challenges, technical preview issues encountered while applying this process in an actual production app.

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

|Name|Widget|Description|                                                                                                                                 |---|---|---|
| `/flutter-screen`        | FlutterScreen       | Shows a full screen Flutter view. Can be either presented as an `Activity` or full screen `ViewController` in Android and iOS respectively. |
| `/flutter-embedded-view` | FlutterEmbeddedView | Shows a particular section of the app in Flutter.|

### Slides

TBD

### Feedback

If you are a participant of this session, feel free to submit a feedback [here](http://bit.ly/2rcOIQh).

### Support

I would highly appreciate if we connect on Twitter or Github, and discuss Fluttery things over a cup of coffee ☕.
* Twitter: [@joshuamdeguzman](https://twitter.com/joshuamdeguzman)
* Github: [@joshuadeguzman](https://github.com/joshuadeguzman)

## Cool stuff to try out!
Awesome Flutter
* https://github.com/Solido/awesome-flutter

Flutter Showcase by 2dimensions
* https://play.google.com/store/apps/details?id=com.two_dimensions.showcaseapp&hl=en_US
* https://play.google.com/store/apps/details?id=com.two_dimensions.showcaseapp&hl=en_US

Flutter Developer Quest
* https://play.google.com/store/apps/details?id=dev.flutter.devRpg&hl=en
* https://apps.apple.com/us/app/flutter-developer-quest/id1455994402

### License

devfest-flutter-to-native is released under the BSD-3 Clause License. See [LICENSE](https://github.com/joshuadeguzman/devfest-flutter-to-native/blob/master/LICENSE) for details.
