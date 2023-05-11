# Dartivemon

Dartivemon is a CLI tool that runs a Dart application and a Flutter application simultaneously. It also watches for changes in your Dart application and automatically restarts it whenever changes are detected.

## Features
- **Hot Reload:** Automatically restarts your Dart app whenever changes are detected.
- **Concurrent Execution:** Runs Dart and Flutter apps concurrently.

## Usage
1. Create an instance of the Dartivemon class:
    ```dart
    var monitor = Dartivemon();
    ```

2. Start the monitor:
    ```dart
    monitor.start();
    ```

## How it Works
- **runDartApp:** Starts your Dart app (`app.dart`) and watches for any changes. If changes are detected, it automatically restarts your app.

- **runFlutterApp:** Asks for your device ID and starts your Flutter app on the specified device.

- **start:** Starts running your Dart and Flutter apps concurrently. It also listens for 'r' or 'R' input from stdin. If either is detected, it sends the input to the Flutter app.

## Notes
- Make sure to replace `'app.dart'` and `'flutter_app_dir'` with your actual Dart and Flutter app directories respectively.
- The Flutter app is started using the device ID entered by the user. Make sure to enter the correct device ID.
- If the Dart app file ('app.dart') is modified, the Dart app will be restarted automatically.
- If you enter 'r' or 'R' into the console, it will be sent to the Flutter process.
