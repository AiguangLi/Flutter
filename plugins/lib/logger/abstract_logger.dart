abstract class Logger {
  Future<void> debug(String log);
  Future<void> warning(String log);
  Future<void> error(String log);
  Future<void> info(String log);
  Future<String> readLog(String type, String date) async {
    return '';
  }
}