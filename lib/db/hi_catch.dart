import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

/// @name：hi_catch
/// @package：db
/// @author：345 QQ:1831712732
/// @time：2021/05/07 11:33
/// @des：

class HiCache {
  SharedPreferences _prefs;

  HiCache._() {
    init();
  }

  HiCache._pre(SharedPreferences prefs) {
    this._prefs = prefs;
  }

  static HiCache _instance;

  static Future<HiCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
    return _instance;
  }

  static HiCache getInstance() {
    if (_instance == null) {
      _instance = HiCache._();
    }
    return _instance;
  }

  init() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  setString(String key, String value) => _prefs.setString(key, value);

  setDouble(String key, double value) => _prefs.setDouble(key, value);

  setInt(String key, int value) => _prefs.setInt(key, value);

  setBool(String key, bool value) => _prefs.setBool(key, value);

  setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);

  T get<T>(String key) => _prefs.get(key);
}
