# Dartivemon

Dartivemon is a CLI tool that runs a Dart application and a Flutter application simultaneously. It also watches for changes in your Dart application and automatically restarts it whenever changes are detected.

## Features
- **Hot Reload:** Automatically restarts your Dart app whenever changes are detected.
- **Concurrent Execution:** Runs Dart and Flutter apps concurrently.
- **CLI Support:** Allows you to specify a `.dart` file to run or watch.
- **Flutter App Execution:** Can run a Flutter application by using the `fe` command.

## Usage
Run Dartivemon from the command line by specifying a `.dart` file, `fe` for running a Flutter application, or `be` followed by a `.dart` file to watch and run the file:

```bash
dart dartivemon.dart [filename | fe | be filename]
dart dartivemon.dart test.dart
dart dartivemon.dart fe
dart dartivemon.dart be test.dart
```

# How it Works
* `runDartApp`: Starts your Dart app and watches for any changes. If changes are detected, it automatically restarts your app.
* `runFlutterApp`: Asks for your device ID and starts your Flutter app on the specified device.
start: Starts running your Dart and Flutter apps concurrently. It also listens for 'r' or 'R' input from stdin. If either is detected, it sends the input to the Flutter app.

# Notes
* The Flutter app is started using the device ID entered by the user. Make sure to enter the correct device ID.
* If the Dart app file is modified, the Dart app will be restarted automatically.
* If you enter 'r' or 'R' into the console, it will be sent to the Flutter process.


This updated documentation reflects the added CLI functionality and new ways of using Dartivemon.
