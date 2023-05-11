import 'dart:io';
import 'dart:async';

void main(List<String> arguments) async {
  if (arguments.isEmpty || !arguments[0].endsWith('.dart')) {
    print('Please specify a valid .dart file to run.');
    exitCode = 2;
  } else {
    String filename = arguments[0];
    await watchAndRunDartFile(filename);
  }
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
