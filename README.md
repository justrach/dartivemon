# Dartivemon

Dartivemon is a CLI tool that runs a Dart application and a Flutter application simultaneously. It also watches for changes in your Dart application and automatically restarts it whenever changes are detected.

## Features
- **Hot Reload:** Automatically restarts your Dart app whenever changes are detected.
- **Flutter Run:** Runs a Flutter app on a specified device.

## Installation
To install Dartivemon, use the `dart pub global activate` command:
```bash
dart pub global activate dartivemon
```
# Usage
Run Dartivemon from the command line by specifying a `.dart` file, `fe` for running a Flutter application, or `be` followed by a `.dart` file to watch and run the file:
### To update Dartivemon, use the same command again.
Run Dartivemon with one of the following commands:

```bash

dartivemon fe: Runs Flutter app.
dartivemon be <filename>: Watches and runs Dart backend file.
dartivemon <filename>: Watches and runs Dart file.
```
You can also display the help message with -help command:
`dartivemon -help`

# How it Works
* **watchAndRunDartFile**: Starts your Dart app and watches for any changes. If changes are detected, it automatically restarts your app.

* **runFlutterApp**: Asks for your device ID and starts your Flutter app on the specified device.

* **displayHelpMessage**: Displays a help message with usage instructions.
# Notes
* The Flutter app is started using the device ID entered by the user. Make sure to enter the correct device ID.
* If the Dart app file is modified, the Dart server/app will be restarted automatically.
* If you enter 'r' or 'R' into the console, it will be sent to the Flutter process.


This updated documentation reflects the added CLI functionality and new ways of using Dartivemon.
