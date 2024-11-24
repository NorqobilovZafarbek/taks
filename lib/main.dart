import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_n1/infrasturucture/services/local_database.dart';
import 'package:task_n1/presentation/app/app_init.dart';
import 'package:task_n1/presentation/app/app_scope.dart';

// Global navigator key for Material widget
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//Global BuildContext instate
BuildContext getContext = navigatorKey.currentState!.context;

Future<void> main() async {
  await AppInit.initialize();

  runApp(
    Builder(
      builder: (context) {
        return RepositoryProvider(
          create: (context) => LocalDb.instate,
          child: const AppScope(),
        );
      },
    ),
  );
}
