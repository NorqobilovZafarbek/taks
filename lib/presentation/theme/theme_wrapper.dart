part of 'theme.dart';

class ThemeWrapper extends StatelessWidget {
  const ThemeWrapper({
    super.key,
    required this.builder,
  });
  final Widget Function(
    BuildContext context,
    ColorSet colors,
    IconSet icons,
    FontSet fonts,
    CustomTheme controller,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomTheme>(
      builder: (context, theme, child) {
        return builder(
          context,
          theme.colors,
          theme.icons,
          theme.fonts,
          theme,
        );
      },
    );
  }
}
