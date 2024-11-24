enum AppTheme {
  dark,
  light;

  bool get isDark => this == AppTheme.dark;

  static AppTheme? fromString(String? theme) {
    return switch (theme) {
      "light" => AppTheme.light,
      "dark" => AppTheme.dark,
      _ => null,
    };
  }
}
