import 'package:flutter/material.dart';
import 'package:flutter_assessment/screens/posts/posts_page.dart';

Map<String, PageRoute<dynamic> Function(Object)> routes = {
  Routes.root: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.root),
        builder: (context) => const PostsPage(),
      ),
};

class Routes {
  Routes._();

  static const root = '/';
}
