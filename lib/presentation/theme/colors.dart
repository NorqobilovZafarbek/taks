part of 'theme.dart';

class ColorSet {
  final Color scaffold;
  final Color yellow;
  final Color white;
  final Color black;
  final Color blue;
  final Color primary;
  final Color hintColor;
  final Color textField;
  final Color buttonBackground;
  final Color appBarBorder;
  final Color negative;
  final Color transparentWhite10;
  final Color secondaryText;
  final Color canceledButtonColor;
  final Color dividerColor;
  final Color carInfoTitleColor;
  final Color carClassColor;
  final Color grey;
  final Color green;
  final Color grey50;
  final Color textMainColor;

  const ColorSet._({
    required this.textMainColor,
    required this.grey50,
    required this.green,
    required this.grey,
    required this.carInfoTitleColor,
    required this.carClassColor,
    required this.canceledButtonColor,
    required this.dividerColor,
    required this.hintColor,
    required this.blue,
    required this.white,
    required this.black,
    required this.scaffold,
    required this.yellow,
    required this.primary,
    required this.textField,
    required this.buttonBackground,
    required this.appBarBorder,
    required this.negative,
    required this.transparentWhite10,
    required this.secondaryText,
  });

  factory ColorSet.create(AppTheme mode) {
    return mode.isDark ? ColorSet._createDark() : ColorSet._createLight();
  }

  factory ColorSet._createDark() {
    return ColorSet._(
      textMainColor: Style.textMainColor,
      grey50: Style.grey50,
      green: Style.green,
      grey: Style.grey,
      carClassColor: Style.grey80,
      carInfoTitleColor: Style.grey30,
      dividerColor: Style.grey10,
      hintColor: Style.white.withOpacity(.1),
      blue: Style.blue,
      white: Style.white100,
      black: Style.black,
      scaffold: Style.darkScaffold,
      yellow: Style.lightYellow,
      primary: Style.yellow,
      textField: Style.darkTextField,
      buttonBackground: Style.darkTextField,
      appBarBorder: Style.grey10,
      negative: Style.white,
      transparentWhite10: Style.white.withOpacity(0.1),
      secondaryText: Style.darkSecondaryTextColor,
      canceledButtonColor: Style.red,
    );
  }

  factory ColorSet._createLight() {
    return ColorSet._(
      textMainColor: Style.textMainColor,
      grey50: Style.grey50,
      green: Style.green,
      grey: Style.grey,
      carClassColor: Style.grey80,
      carInfoTitleColor: Style.grey30,
      dividerColor: Style.grey10,
      canceledButtonColor: Style.red,
      hintColor: Style.black.withOpacity(.2),
      blue: Style.blue,
      white: Style.white100,
      black: Style.black,
      scaffold: Style.white100,
      yellow: Style.lightYellow,
      primary: Style.yellow,
      textField: Style.textField,
      buttonBackground: Style.white100,
      appBarBorder: Style.grey10,
      negative: Style.black,
      transparentWhite10: Style.grey10,
      secondaryText: Style.black,
    );
  }
}
