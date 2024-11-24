part of 'extention.dart';

extension PermissionExt on LocationPermission {
  bool get isDenied =>
      this == LocationPermission.denied ||
      this == LocationPermission.deniedForever;
}

extension ConvertPoint on Position {
  Point  toPoint() {
    return Point(latitude: latitude, longitude: longitude);
  }
}
