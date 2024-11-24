import 'package:geolocator/geolocator.dart';
import 'package:task_n1/infrasturucture/extention/extention.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

mixin LocationMixin {
  Future<Point?> getPosition() async {
    try {
      return ((await Geolocator.getLastKnownPosition()) ??
              (await Geolocator.getCurrentPosition()))
          .toPoint();
    } catch (e) {
      return null;
    }
  }
}
