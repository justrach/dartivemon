// import 'dart:io';

// class Dartivemon {
//   Process? dartProcess;
//   Process? flutterProcess;

//   void start() async {
//     await Future.wait([
//       runDartApp(),
//       runFlutterApp(),
//     ]);

//     // Start listening to user input after processes have started
//     stdin.echoMode = false;
//     stdin.lineMode = false;
//     stdin.listen((List<int> event) {
//       final input = String.fromCharCodes(event).trim();
//       if (input == 'r' || input == 'R') {
//         _sendToFlutterProcess(input);
//       }
//     });
//   }

//   Future<void> runDartApp() async {
//     dartProcess = await Process.start('dart', ['app.dart']);
//     _redirectOutput(dartProcess!);

//     // Listen for changes in app.dart and restart the process if any
//     File('app.dart').watch().listen((event) async {
//       dartProcess?.kill();
//       dartProcess = await Process.start('dart', ['app.dart']);
//       _redirectOutput(dartProcess!);
//     });
//   }

//   Future<void> runFlutterApp() async {
//     print("Please take note of your device ID");
//     flutterProcess = await Process.start('flutter', ['run']);
//     print("Please input your device ID:");
//     String? deviceID = stdin.readLineSync();
//     if (deviceID == null || deviceID.isEmpty) {
//       print("Invalid device ID. Please try again with a valid device ID.");
//       exit(1);
//     }

//     flutterProcess = await Process.start('flutter', ['run', '-d', deviceID]);
//     _redirectOutput(flutterProcess!);
//   }

//   void _redirectOutput(Process process) {
//     process.stdout.transform(SystemEncoding().decoder).listen(print);
//     process.stderr.transform(SystemEncoding().decoder).listen(print);
//   }

//   void _sendToFlutterProcess(String input) {
//     flutterProcess?.stdin.writeln(input);
//   }
// }
