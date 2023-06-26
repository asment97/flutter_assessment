import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/providers/app_provider.dart';
import 'package:flutter_assessment/core/theme/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      builder: (context, child) => child!,
      title: 'Flutter Assessment',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      initialRoute: Routes.root,
      onGenerateRoute: (settings) {
        return routes[settings.name]!(settings.arguments ?? '');
      },
    );
  }
}
