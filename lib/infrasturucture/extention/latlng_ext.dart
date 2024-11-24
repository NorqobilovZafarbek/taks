part of 'extention.dart';

extension LatlngExt on Point {
  static Point fromMap(Map<String, dynamic> json) {
    return Point(
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double);
  }
}
