import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n1/presentation/app/app.dart';
import 'package:task_n1/presentation/theme/theme.dart';

class AppScope extends StatefulWidget {
  const AppScope({super.key});

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Theme provider
        ChangeNotifierProvider<CustomTheme>(
          create: (context) => CustomTheme.create(),
        ),
      ],
      child: const App(),
    );
  }
}
