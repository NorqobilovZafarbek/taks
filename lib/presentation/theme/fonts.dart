part of 'theme.dart';

class FontSet {
  final TextStyle regular12;
  final TextStyle regular14;
  final TextStyle regular16;
  final TextStyle regular18;
  final TextStyle bold18;
  final TextStyle bold22;
  final TextStyle semiBold16;
  final TextStyle semiBold18;
  final TextStyle extraBold24;
  final TextStyle extraBold32;
  final TextStyle medium16;
  final TextStyle medium18;
  final TextStyle fe16;
  final TextStyle fe12;
  final TextStyle fe6;

  const FontSet._({
    required this.fe6,
    required this.fe12,
    required this.fe16,
    required this.bold22,
    required this.regular12,
    required this.regular14,
    required this.regular16,
    required this.regular18,
    required this.bold18,
    required this.medium16,
    required this.medium18,
    required this.semiBold16,
    required this.semiBold18,
    required this.extraBold24,
    required this.extraBold32,
  });

  factory FontSet.create(AppTheme mode) {
    return mode.isDark ? FontSet._createDark() : FontSet._createLight();
  }

  factory FontSet._createLight() {
    return FontSet._(
      bold22: Style.bold22(),
      fe6: Style.fe6(),
      fe12: Style.fe12(),
      fe16: Style.fe16(),
      semiBold18: Style.semyBold18(),
      medium16: Style.medium16(),
      medium18: Style.medium18(),
      extraBold32: Style.extraBold32(),
      bold18: Style.bold18(),
      regular12: Style.regular12(),
      regular14: Style.regular14(),
      regular16: Style.regular16(),
      regular18: Style.regular18(),
      semiBold16: Style.semiBold16(),
      extraBold24: Style.extraBold24(),
    );
  }

  factory FontSet._createDark() {
    return FontSet._(
      bold22: Style.bold22(color: Style.white),
      fe6: Style.fe6(color: Style.white),
      fe12: Style.fe12(color: Style.white),
      fe16: Style.fe16(color: Style.white),
      semiBold18: Style.semyBold18(color: Style.white),
      medium16: Style.medium16(color: Style.white),
      medium18: Style.medium18(color: Style.white),
      extraBold32: Style.extraBold32(color: Style.white),
      bold18: Style.bold18(color: Style.white),
      regular12: Style.regular12(color: Style.white),
      regular14: Style.regular14(color: Style.white),
      regular16: Style.regular16(color: Style.white),
      regular18: Style.regular18(color: Style.white),
      semiBold16: Style.semiBold16(color: Style.white),
      extraBold24: Style.extraBold24(color: Style.white),
    );
  }
}
