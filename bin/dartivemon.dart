import 'dart:io';
import 'dart:async';

void main(List<String> arguments) async {
  if (arguments.isEmpty || arguments[0] == '-help') {
    displayHelpMessage();
    exitCode = 2;
  } else {
    String command = arguments[0];

    if (command == 'fe') {
      await runFlutterApp();
    } else if (command == 'be' && arguments.length > 1) {
      String filename = arguments[1];
      await watchAndRunDartFile(filename);
    } else if (command.endsWith('.dart')) {
      await watchAndRunDartFile(command);
    } else {
      print('Invalid command or filename.');
      displayHelpMessage();
      exitCode = 2;
    }
  }
}

void displayHelpMessage() {
  print('Usage: dartivemon <command> [<filename>]\n'
      'Commands:\n'
      '  fe                   Run Flutter app\n'
      '  be <filename>        Watch and run Dart backend file\n'
      '  <filename>           Watch and run Dart file\n'
      '  -help                Display this help message\n');
}
Future<void> watchAndRunDartFile(String filename) async {
  Process? dartProcess;

  // Run initial dart process
  dartProcess = await runDartProcess(filename, dartProcess);

  // Start file watcher
  final file = File(filename);
  await for (final event in file.watch()) {
    if (event.type == FileSystemEvent.modify) {
      print('$filename modified, restarting...');
      dartProcess = await runDartProcess(filename, dartProcess);
    }
  }
}

Future<Process> runDartProcess(String filename, Process? oldProcess) async {
  // Kill old process if it exists
  oldProcess?.kill();
  // Start new process
  Process process = await Process.start('dart', [filename]);

  // Redirect stdout and stderr
  process.stdout.transform(SystemEncoding().decoder).listen(print);
  process.stderr.transform(SystemEncoding().decoder).listen(print);

  return process;
}

Future<void> runFlutterApp() async {
  print("Please take note of your device ID");
  Process? flutterProcess = await Process.start('flutter', ['run']);
  print("Please input your device ID:");
  String? deviceID = stdin.readLineSync();
  if (deviceID == null || deviceID.isEmpty) {
    print("Invalid device ID. Please try again with a valid device ID.");
    exit(1);
  }

  flutterProcess = await Process.start('flutter', ['run', '-d', deviceID]);
  _redirectOutput(flutterProcess);
}

void _redirectOutput(Process process) {
  process.stdout.transform(SystemEncoding().decoder).listen(print);
  process.stderr.transform(SystemEncoding().decoder).listen(print);
}
