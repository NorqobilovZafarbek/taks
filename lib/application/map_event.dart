part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();
}

class SearchEvent extends MapEvent {
  final String query;
  final Point? point;

  const SearchEvent(this.query, this.point);

  @override
  List<Object?> get props => [query];
}

class SearchPlace extends MapEvent {
  final String query;
  final Point? latLng;

  const SearchPlace(this.latLng, this.query);

  @override
  List<Object?> get props => [query, latLng];
}

class SelectPlace extends MapEvent {
  final SearchItem item;

  const SelectPlace(this.item);

  @override
  List<Object?> get props => [item];
}
