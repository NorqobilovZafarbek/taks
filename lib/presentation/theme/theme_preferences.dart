part of 'theme.dart';

class ThemePreferences {
  final LocalDb local;
  const ThemePreferences(this.local);

  AppTheme get getTheme =>
      AppTheme.fromString(local.getTheme) ?? Constants.defaultTheme;

  Future<void> setTheme(AppTheme theme) => local.setTheme(theme.name);
}
