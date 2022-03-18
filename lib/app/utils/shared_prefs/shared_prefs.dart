import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static read(String key) async {
    return _preferences.getString(key) != null
        ? json.decode(_preferences.getString(key)!)
        : null;
  }

  static readList(String key) async {
    return _preferences.getString(key) != null
        ? _preferences.getString(key)
        : null;
  }

  static save(String key, value) async {
    await _preferences.setString(key, json.encode(value));
  }

  static saveList(String key, value) async {
    await _preferences.setString(key, value);
  }

  static remove(String key) async {
    _preferences.remove(key);
  }
}
