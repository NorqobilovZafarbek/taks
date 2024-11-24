part of 'theme.dart';

class IconSet {
  // Images
  final String logo;
  final String lock;
  final String user;
  final String task;
  final String location;
  final String filter;
  final String outlineLocation;

  const IconSet._({
    // Images
    required this.outlineLocation,
    required this.filter,
    required this.location,
    required this.task,
    required this.logo,
    required this.lock,
    required this.user,
  });

  static String imgPath(String name) => "assets/img/$name.png";

  static String svgPathLight(String name) => "assets/svg/$name.svg";

  factory IconSet.create(AppTheme mode) {
    // Images
    final logo = imgPath("logo");
    final lock = svgPathLight("lock");
    final user = svgPathLight("userr");
    final taskIcons = svgPathLight("task_icon");
    final location = imgPath('location');
    final filter = svgPathLight('filter');
    final outlineLocation = svgPathLight('location_outline');

    return IconSet._(
      outlineLocation: outlineLocation,
      filter: filter,
      location: location,
      task: taskIcons,
      logo: logo,
      lock: lock,
      user: user,
    );
  }
}
