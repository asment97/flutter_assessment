import 'package:flutter/material.dart';
import 'package:flutter_assessment/screens/app/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // Plugins must be initialized before using
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
