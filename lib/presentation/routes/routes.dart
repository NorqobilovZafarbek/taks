import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_n1/application/map_bloc.dart';
import 'package:task_n1/infrasturucture/constants/constants.dart';
import 'package:task_n1/infrasturucture/repositories/search_repo.dart';
import 'package:task_n1/infrasturucture/services/dio_service.dart';
import 'package:task_n1/presentation/pages/home/home_page.dart';
import '../../main.dart';

abstract final class AppRoutes {
  static final routes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => MapBloc(
            SearchRepository(
              ApiServices(
                baseUrl: Constants.baseUrl,
              ),
            ),
          ),
          child: const HomePage(),
        ),
      ),
    ],
  );
}
