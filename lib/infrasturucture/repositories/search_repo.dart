import 'package:task_n1/infrasturucture/models/model.dart';
import 'package:task_n1/infrasturucture/services/dio_service.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SearchRepository {
  ApiServices _apiServices;

  SearchRepository(this._apiServices);

  Future<List<SearchItem>> searchAddress(String query, Point? point) async {
    final res = await YandexSearch.searchByText(
      searchText: query,
      searchOptions: SearchOptions(
        userPosition: point,
        searchType: SearchType.geo,
        geometry: false,
      ),
      geometry: Geometry.fromBoundingBox(
        const BoundingBox(
          southWest: Point(
            latitude: 55.76996383933034,
            longitude: 37.57483142322235,
          ),
          northEast: Point(
            latitude: 55.785322774728414,
            longitude: 37.590924677311705,
          ),
        ),
      ),
    );
    final result = (await res.$2).items;
    return result ?? [];
  }

  Future<List<Shop>> searchPlace(String query, Point? point) async {
    final result = await _apiServices.request('/api/v1/rest/shops/paginate',
        convert: (json) =>
            ShopResponse.fromJson((json as Map).cast<String, dynamic>()),
        queryParams: {
          'lang': 'en',
          'location_type': 2,
          'column': 'distance',
          'sort': 'asc',
          if (point != null) 'address%5Blatitude%5D': point.latitude,
          if (point != null) 'address%5Blongitude%5D': point.longitude,
          'search': query,
        });
    return result.data;
  }
}
