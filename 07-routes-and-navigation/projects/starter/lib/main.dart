import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'di/locator.dart';
import 'di/providers.dart';
import 'fooderlich_theme.dart';
import 'navigation/app_router.dart';

void main() async {
  await setupLocator();
  runApp(
    const ProviderScope(
      child: Fooderlich(),
    ),
  );
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  _FooderlichState createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final AppRouter _appRouter = locator.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final profileManager = watch(profileManagerProvider);

        ThemeData theme;
        if (profileManager.darkMode) {
          theme = FooderlichTheme.dark();
        } else {
          theme = FooderlichTheme.light();
        }

        return MaterialApp(
          theme: theme,
          title: 'Fooderlich',
          home: Router(
            routerDelegate: _appRouter,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        );
      },
    );
  }
}
