import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:task_n1/application/map_bloc.dart';
import 'package:task_n1/infrasturucture/extention/extention.dart';
import 'package:task_n1/presentation/components/search_bottom_sheet.dart';
import 'package:task_n1/presentation/pages/home/mixin.dart';
import 'package:task_n1/presentation/pages/home/widgets/place_bottom_sheet.dart';
import 'package:task_n1/presentation/theme/theme.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LocationMixin {
  Point? position;
  final Completer<YandexMapController> completer = Completer();

  Future<bool> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission.isDenied) {
      permission = await Geolocator.requestPermission();
      if (permission.isDenied) {
        await Geolocator.openAppSettings();
        return false;
      }
    }
    try {
      position = await getPosition();
      return true;
    } catch (e) {
      await Geolocator.openLocationSettings();
    }
    return false;
  }

  void showSearchBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        final blocValue = context.read<MapBloc>();
        return BlocProvider.value(
          value: blocValue,
          child: SearchBottomSheet(
            onSumbit: (value) async {
              context.read<MapBloc>().add(
                    SearchPlace(await getPosition(), value),
                  );
              context.pop();
              showPlace(context, blocValue);
            },
            onResultTap: (item) async {
              final controller = await completer.future;
              final point = item.toponymMetadata?.balloonPoint;
              if (point == null) return;
              controller.animateTo(point);
              context.read<MapBloc>().add(SelectPlace(item));
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, icons, fonts, controller) => Scaffold(
        body: Stack(
          children: [
            BlocConsumer<MapBloc, MapState>(
              listener: (context, state) async {
                if (state.placeStatus.isSuccess) {
                  final box = state.places.boundingBox();
                  if (box == null) return;
                  final controller = await completer.future;
                  await controller.moveCamera(
                    CameraUpdate.newGeometry(
                      Geometry.fromBoundingBox(
                        BoundingBox(
                          northEast: box.$1,
                          southWest: box.$2,
                        ),
                      ),
                    ),
                  );
                  controller.moveCamera(CameraUpdate.zoomOut());
                }
              },
              builder: (context, state) {
                return YandexMap(
                  mapObjects: state.placeMarks,
                  onMapCreated: (controller) async {
                    completer.complete(controller);
                    bool isHavePermission = await checkPermission();
                    if (isHavePermission) {
                      await controller.animateTo(position!);
                    }
                  },
                );
              },
            ),
            SafeArea(
              child: GestureDetector(
                onTap: showSearchBottomSheet,
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: colors.grey50,
                        offset: const Offset(0, 0),
                        blurRadius: 10,
                      ),
                    ],
                    color: colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Search'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPlace(BuildContext newContext, MapBloc bloc) {
    showModalBottomSheet(
      context: newContext,
      isScrollControlled: true,
      builder: (_) {
        return ThemeWrapper(
          builder: (context, colors, icons, fonts, controller) {
            return PlacesBottomSheet(bloc: bloc);
          },
        );
      },
    );
  }
}
