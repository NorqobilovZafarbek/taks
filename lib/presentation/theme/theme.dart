import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:task_n1/infrasturucture/services/local_database.dart';
import 'package:task_n1/presentation/theme/app_theme.dart';

import '../../infrasturucture/constants/constants.dart';

part 'style.dart';

part 'colors.dart';

part 'icons.dart';

part 'fonts.dart';

part 'theme_wrapper.dart';

part 'theme_preferences.dart';

final class CustomTheme with ChangeNotifier {
  CustomTheme._(
    this._preferences,
    this._mode,
    this._colors,
    this._icons,
    this._fonts,
  );

  final ThemePreferences _preferences;
  AppTheme _mode;
  ColorSet _colors;
  IconSet _icons;
  FontSet _fonts;

  AppTheme get mode => _mode;

  ColorSet get colors => _colors;

  IconSet get icons => _icons;

  FontSet get fonts => _fonts;

  bool get isDark => _mode.isDark;

  factory CustomTheme.create() {
    final preferences = ThemePreferences(LocalDb.instate);
    final mode = preferences.getTheme;
    final colors = ColorSet.create(mode);
    final icons = IconSet.create(mode);
    final fonts = FontSet.create(mode);
    _setLoadingStyle(mode);

    return CustomTheme._(
      preferences,
      mode,
      colors,
      icons,
      fonts,
    );
  }

  Future<void> setDark() async => await update(AppTheme.dark);

  Future<void> setLight() async => await update(AppTheme.light);

  Future<void> update(AppTheme mode) async {
    _mode = mode;
    _colors = ColorSet.create(mode);
    _icons = IconSet.create(mode);
    _fonts = FontSet.create(mode);
    await _preferences.setTheme(mode);
    _setLoadingStyle(mode);
    notifyListeners();
  }

  Future<void> toggle() async {
    if (mode.isDark) {
      await setLight();
    } else {
      await setDark();
    }
  }

  T resolve<T>({
    required T Function() onDark,
    required T Function() onLight,
  }) {
    return isDark ? onDark() : onLight();
  }

  T fold<T>({
    required T onDark,
    required T onLight,
  }) {
    return isDark ? onDark : onLight;
  }

  static void _setLoadingStyle(AppTheme mode) {
    EasyLoading.instance
      ..contentPadding = const EdgeInsets.all(15)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..radius = 50
      ..dismissOnTap = true
      ..maskType = EasyLoadingMaskType.black
      ..backgroundColor = Style.white.withOpacity(.8)
      ..indicatorColor = Style.white
      ..textColor = Style.black
      ..indicatorSize = 32;
  }
}
