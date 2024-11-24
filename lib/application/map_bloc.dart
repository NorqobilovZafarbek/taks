import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_n1/infrasturucture/models/model.dart';
import 'package:task_n1/infrasturucture/models/status.dart';
import 'package:task_n1/infrasturucture/repositories/search_repo.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final SearchRepository repository;

  MapBloc(this.repository) : super(const MapState()) {
    on<MapEvent>(
      (event, emit) => switch (event) {
        SearchEvent event => _onSearch(event, emit),
        SearchPlace event => _onSearchPlace(event, emit),
        SelectPlace event => _selectPlace(event, emit),
      },
    );
  }

  Future<void> _onSearch(
    SearchEvent event,
    Emitter<MapState> emit,
  ) async {
    if (state.searchStatus.isLoading) return;
    emit(state.copyWith(searchStatus: Status.loading));
    final res = await repository.searchAddress(event.query, event.point);
    emit(
      state.copyWith(
        result: res,
        searchStatus: Status.success,
      ),
    );
  }

  Future<void> _onSearchPlace(
    SearchPlace event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(placeStatus: Status.loading));
    final res = await repository.searchPlace(event.query, event.latLng);
    emit(
      state.copyWith(
        places: res,
        placeMarks: _convert(res),
        placeStatus: Status.success,
      ),
    );
  }

  void _selectPlace(SelectPlace event, Emitter<MapState> emit) {
    final placeMarks = _convertPlaceMark(event.item);
    emit(
      state.copyWith(
        result: [],
        placeMarks: placeMarks,
        searchStatus: Status.initial,
      ),
    );
  }

  List<PlacemarkMapObject> _convertPlaceMark(SearchItem item) {
    final point = item.toponymMetadata?.balloonPoint;
    if (point == null) return [];
    PlacemarkMapObject placemarkMapObject = PlacemarkMapObject(
      mapId: MapObjectId(item.name),
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          scale: 2,
          image: BitmapDescriptor.fromAssetImage('assets/img/location.png'),
        ),
      ),
      point: point,
    );
    return [placemarkMapObject];
  }

  List<PlacemarkMapObject> _convert(List<Shop> shops) {
    return shops
        .map(
          (e) => PlacemarkMapObject(
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                scale: 2,
                image:
                    BitmapDescriptor.fromAssetImage('assets/img/location.png'),
              ),
            ),
            mapId: MapObjectId(e.id.toString()),
            point: e.latLong,
          ),
        )
        .toList();
  }
}
