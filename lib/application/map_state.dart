part of 'map_bloc.dart';

class MapState extends Equatable {
  final Status searchStatus;
  final Status placeStatus;
  final List<Shop> places;
  final List<SearchItem> result;
  final List<PlacemarkMapObject> placeMarks;

  const MapState({
    this.placeStatus = Status.initial,
    this.placeMarks = const [],
    this.result = const [],
    this.searchStatus = Status.initial,
    this.places = const [],
  });

  @override
  List<Object?> get props => [
        searchStatus,
        places,
        result,
        placeMarks,
        placeStatus,
      ];

  MapState copyWith({
    Status? searchStatus,
    Status? placeStatus,
    List<Shop>? places,
    List<PlacemarkMapObject>? placeMarks,
    List<SearchItem>? result,
  }) {
    return MapState(
      placeMarks: placeMarks ?? this.placeMarks,
      searchStatus: searchStatus ?? this.searchStatus,
      places: places ?? this.places,
      result: result ?? this.result,
      placeStatus: placeStatus ?? this.placeStatus,
    );
  }
}
