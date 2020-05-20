import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

import 'abstract_logger.dart';

class FileLogger implements Logger {
  static Future<void> _appendToFile(String fileName, String content) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$fileName');
    await file.writeAsString(content, mode: FileMode.append);
  }

  @override
  Future<void> debug(String log) async {
    String fileName = FileLogger._getLogFileName('debug');
    await FileLogger._appendToFile(fileName, log);
  }

  @override
  Future<void> error(String log) async {
    String fileName = FileLogger._getLogFileName('error');
    await FileLogger._appendToFile(fileName, log);
  }

  @override
  Future<void> info(String log) async {
    String fileName = FileLogger._getLogFileName('info');
    await FileLogger._appendToFile(fileName, log);
  }

  @override
  Future<void> warning(String log) async {
    String fileName = FileLogger._getLogFileName('warning');
    await FileLogger._appendToFile(fileName, log);
  }

  static String _getLogFileName(String type) {
    DateTime now = DateTime.now();
    String fileName = '${type}_${now.year}_${now.month}_${now.day}.log';

    return fileName;
  }

  @override
  Future<String> readLog(String type, String date) async {
    try {
      String dir = (await getApplicationDocumentsDirectory()).path;
      String fileName = '${type}_$date.log';
      File file = File('$dir/$fileName');
      String content = await file?.readAsString();

      return content;
    } on FileSystemException {
      return '';
    }
  }
}
