import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static const _theme = "theme";

  final SharedPreferences db;

  const LocalDb._(this.db);

  static LocalDb? _instance;

  static LocalDb instate = _instance!;

  static Future<LocalDb> initialize() async {
    if (_instance != null) {
      return _instance!;
    }
    final db = await SharedPreferences.getInstance();
    _instance = LocalDb._(db);
    return _instance!;
  }

  String? get getTheme => db.getString(_theme);

  Future<void> setTheme(String theme) => db.setString(_theme, theme);
}
