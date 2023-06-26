import 'package:flutter/material.dart';
import 'package:flutter_assessment/screens/posts/post_details_page.dart';
import 'package:flutter_assessment/screens/posts/posts_page.dart';

Map<String, PageRoute<dynamic> Function(Object)> routes = {
  Routes.root: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.root),
        builder: (context) => const PostsPage(),
      ),
  Routes.postDetails: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.postDetails),
        builder: (context) => const PostDetailsPage(),
      ),
};

class Routes {
  Routes._();

  static const root = '/';
  static const postDetails = '/post-details';
}
