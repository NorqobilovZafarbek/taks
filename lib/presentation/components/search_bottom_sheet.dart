import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_n1/application/map_bloc.dart';
import 'package:task_n1/presentation/components/custom_text_field.dart';
import 'package:task_n1/presentation/pages/home/mixin.dart';
import 'package:task_n1/presentation/theme/theme.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SearchBottomSheet extends StatefulWidget {
  final void Function(SearchItem item) onResultTap;
  final void Function(String value) onSumbit;

  const SearchBottomSheet({
    super.key,
    required this.onResultTap,
    required this.onSumbit,
  });

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet>
    with LocationMixin {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, icons, fonts, controller) => Container(
        margin: MediaQuery.viewInsetsOf(context),
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                onSubmitted: widget.onSumbit,
                icon: icons.outlineLocation,
                onChange: (value) async {
                  context.read<MapBloc>().add(
                        SearchEvent(value, await getPosition()),
                      );
                },
                hintText: 'Search',
              ),
            ),
            BlocBuilder<MapBloc, MapState>(
              builder: (context, state) {
                return SizedBox(
                  height: 300,
                  child: state.searchStatus.maybeMap(
                    orElse: () {
                      return const Center(
                        child: Text('Empty'),
                      );
                    },
                    onLoading: () => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    onSuccess: () => ListView.builder(
                      itemCount: state.result.length,
                      itemBuilder: (context, index) {
                        final searchItem = state.result.elementAt(index);
                        return ListTile(
                          leading: SvgPicture.asset(
                            icons.outlineLocation,
                            height: 20,
                            width: 20,
                          ),
                          onTap: () {
                            widget.onResultTap.call(searchItem);
                            context.pop();
                          },
                          title: Text(
                            searchItem.name,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
