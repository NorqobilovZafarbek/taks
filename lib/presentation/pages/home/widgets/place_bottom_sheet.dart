import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_n1/application/map_bloc.dart';
import 'package:task_n1/presentation/components/custom_button.dart';
import 'package:task_n1/presentation/theme/theme.dart';

class PlacesBottomSheet extends StatelessWidget {
  final MapBloc bloc;

  const PlacesBottomSheet({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, icons, fonts, controller) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 1,
          expand: false,
          builder: (context, scrollController) {
            return BlocBuilder<MapBloc, MapState>(
              bloc: bloc,
              builder: (newContext, state) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.places.length} salons near you',
                              style: Style.semyBold18(),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: SvgPicture.asset(icons.filter),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: state.places.length,
                          itemBuilder: (newContext, index) {
                            final item = state.places.elementAt(index);
                            return Container(
                              margin: MediaQuery.viewInsetsOf(newContext),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Style.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        item.backgroundImg,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.translation.title,
                                                style: Style.semyBold18(),
                                              ),
                                              Text(
                                                item.translation.description,
                                                maxLines: 1,
                                                style: Style.fe16().copyWith(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                              NetworkImage(item.logoImg),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        CustomButton(
                                          text: 'Hair Salon',
                                          onTap: () {},
                                        ),
                                        const SizedBox(width: 5),
                                        CustomButton(
                                          text: 'Makeup Artist',
                                          onTap: () {},
                                        ),
                                        const SizedBox(width: 5),
                                        CustomButton(
                                          text: 'Makeup Artist',
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(icons.location),
                                        const SizedBox(width: 10),
                                        Text('${item.distance} m.from you'),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text('Excellent. ${item.minPrice} reviews'),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
