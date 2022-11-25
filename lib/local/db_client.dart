import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DbDataType { bool, string, int }

class Dbclient {
  setData(
      {required DbDataType dataType,
      required String key,
      required var value}) async {
    final prefs = await SharedPreferences.getInstance();
    dataType == DbDataType.string
        ? prefs.setString(key, value)
        : dataType == DbDataType.bool
            ? prefs.setBool(key, value)
            : prefs.setInt(key, value);
  }

  // setData(String key, bool value) async {
  //   final prefs = await SharedPreferences.getInstance();,
  //   prefs.setBool(key, value);
  // }

  getData(String key, DbDataType dataType) async {
    final prefs = await SharedPreferences.getInstance();
    final result = dataType == DbDataType.bool
        ? prefs.getBool(key)
        : dataType == DbDataType.int
            ? prefs.getInt(key)
            : prefs.getString(key);
    return result;
  }
}

final dbClientProvider = Provider<Dbclient>((ref) {
  return Dbclient();
});
