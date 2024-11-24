part of 'extention.dart';

extension AnimateExt on YandexMapController {
  Future<void> animateTo(Point point) async {
    await moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: point,
        ),
      ),
    );
  }
}

extension ShopListExt on List<Shop> {
  (Point, Point)? boundingBox() {
    if(isEmpty) return null;
    double minLatitude = first.latLong.latitude;
    double minLongitude = first.latLong.longitude;
    double maxLatitude = first.latLong.latitude;
    double maxLongitude = first.latLong.longitude;
    for(var shop in this) {
      final point = shop.latLong;
      if(point.latitude < minLatitude) minLatitude = point.latitude;
      if(point.longitude < minLongitude) minLongitude = point.longitude;
      if(point.latitude > maxLatitude) maxLatitude = point.latitude;
      if(point.longitude > maxLongitude) maxLongitude = point.longitude;
    }
    return (Point(latitude: maxLatitude, longitude: maxLongitude), Point(latitude: minLatitude, longitude: minLongitude));
  }
}
