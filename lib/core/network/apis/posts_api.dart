import 'package:dio/dio.dart';
import 'package:flutter_assessment/core/network/dio_client.dart';
import 'package:flutter_assessment/core/providers/posts_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postsApiProvider = Provider<PostsApi>((ref) => PostsApi(ref));

class PostsApi {
  final Ref ref;
  PostsApi(this.ref);

  Future<Response> fetchPosts() async {
    try {
      final Response response = await ref.read(dioClientProvider).get(
            "/posts",
          );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchPostDetails() async {
    try {
      final Response response = await ref.read(dioClientProvider).get(
            "/posts/${ref.read(selectedPostIdProvider)}",
          );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchPostComments() async {
    try {
      final Response response = await ref.read(dioClientProvider).get(
        "/comments",
        queryParameters: {
          "postId": ref.read(selectedPostIdProvider),
        },
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
