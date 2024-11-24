part of 'theme.dart';

abstract final class Style {
  static const Color black = Color(0xFF1C1C1E);
  static const Color white = Color(0xFFFCFCFC);
  static const Color white100 = Color(0xFFFFFFFF);
  static const Color lightYellow = Color(0xFFFACC15);
  static const Color yellow = Color(0xFFFFBA09);
  static const Color textField = Color(0xFFF2F2F7);
  static const Color grey10 = Color(0xFFF2F2F7);
  static const Color grey20 = Color(0xFFC7C7CC);
  static const Color grey30 = Color(0xFFAEAEB2);
  static const Color grey50 = Color(0xFFAEAEB2);
  static const Color grey80 = Color(0xFF3A3A3C);
  static const Color grey = Color(0xFF1C1C1E);
  static const Color blue = Color(0xFF067FF3);
  static const Color purple = Color(0xFF9B99F5);
  static const Color green = Color(0xFF00C566);
  static const Color red = Color(0xFFFF4747);
  static const Color dragHangleColor = Color(0xFFE9EBED);
  static const Color textColor = Color(0xFF3A3A3C);
  static const Color textMainColor = Color(0xFF471AA0);

  // dark
  static const Color darkScaffold = Color(0xFF121216);
  static const Color darkTextField = Color(0xFF1A1920);
  static const Color darkSecondaryTextColor = Color(0xFF898992);

  // ---------------------Fonts-----------------------

  static const _display = "Display";
  static const _als = "ALS";
  static const _fe = "FE";

  static TextStyle fe16({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _fe,
      fontSize: 16,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fe12({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _fe,
      fontSize: 12,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fe6({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _fe,
      fontSize: 6,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular12({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _display,
      fontSize: 12,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle semyBold18({
    Color color = black,
  }) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: _display,
    );
  }

  static TextStyle semyBold16({
    Color color = black,
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: _display,
    );
  }

  static TextStyle regular14({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _display,
      fontSize: 14,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular16({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _display,
      fontSize: 16,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular18({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _display,
      fontSize: 18,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium16({
    Color color = black,
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: _display,
    );
  }

  static TextStyle bold22({
    Color color = black,
  }) {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: _display,
    );
  }

  static TextStyle medium18({
    Color color = black,
  }) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: _display,
    );
  }

  static TextStyle semiBold16({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _display,
      fontSize: 16,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold18({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _display,
      fontSize: 18,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle extraBold24({
    Color color = black,
  }) {
    return TextStyle(
      fontFamily: _als,
      fontSize: 24,
      color: color,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle extraBold32({Color color = black}) {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: color,
      fontFamily: _als,
    );
  }
}
