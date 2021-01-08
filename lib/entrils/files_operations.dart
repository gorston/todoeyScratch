import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt').create(recursive: true);
  }

  Future<List<String>> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      List<String> contents = await file.readAsLines();
      contents.remove('');
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      print(e);
    }
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter\n', mode: FileMode.append);
  }

  void delete(int index) async {
    final file = await _localFile;
    List data = await readCounter();
    data.removeAt(index);
    file.writeAsString('');
    if (data == null) {
      await file.delete(recursive: true);
    } else {
      for (String each in data) {
        await file.writeAsString('$each\n', mode: FileMode.append);
      }
    }
  }
}
