import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _prefs;
  static const String _lastCharacterIdKey = 'last_character_id';

  AppPreferences(this._prefs);

  // 获取最后使用的角色ID
  int? getLastCharacterId() {
    return _prefs.getInt(_lastCharacterIdKey);
  }

  // 保存最后使用的角色ID
  Future<void> saveLastCharacterId(int id) async {
    await _prefs.setInt(_lastCharacterIdKey, id);
  }

  // 可以添加其他设置相关的方法
  // Future<void> saveThemeMode(String mode) async {...}
  // String? getThemeMode() {...}
}
