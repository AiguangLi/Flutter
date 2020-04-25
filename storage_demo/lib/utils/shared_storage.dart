import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {

  static Future<bool> getBoolForKey(String key) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(key);
  }

  static Future<String> getStringForKey(String key) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(key);
  }

  static Future<int> getIntForKey(String key) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getInt(key);
  }

  static Future<double> getDoubleForKey(String key) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getDouble(key);
  }

  static Future<List<String>> getStringListForKey(String key) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getStringList(key);
  }

  static void saveBoolForKey(String key, bool value) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool(key, value);
  }

  static void saveStringForKey(String key, String value) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(key, value);
  }

  static void saveIntForKey(String key, int value) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt(key, value);
  }

  static void saveDoubleForKey(String key, double value) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setDouble(key, value);
  }

  static void saveStringListForKey(String key, List<String> value) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setStringList(key, value);
  }
}