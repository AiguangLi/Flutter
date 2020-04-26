import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  static Future<Null> writeToFileInDocumentDirectory(
      String fileName, String content,
      [fileMode = FileMode.append]) async {
    String dir = (await getApplicationDocumentsDirectory()).path;

    File file = File('$dir/$fileName');

    await file.writeAsString(content, mode: fileMode);
  }

  static Future<String> readFromFileInDocumentDirectory(String fileName) async {
    try {
      String dir = (await getApplicationDocumentsDirectory()).path;

      File file = File('$dir/$fileName');
      String content = await file?.readAsString();

      return content;
    } on FileSystemException {
      return '';
    }
  }
}
