import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_assessment/core/models/comment.dart';
import 'package:flutter_assessment/core/models/post.dart';
import 'package:flutter_assessment/core/network/apis/posts_api.dart';
import 'package:flutter_assessment/core/network/dio_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postsRepositoryProvider =
    Provider<PostsRepository>((ref) => PostsRepository(ref));

class PostsRepository {
  final Ref ref;
  PostsRepository(this.ref);

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await ref.read(postsApiProvider).fetchPosts();

      return (response.data as List<dynamic>)
          .map((post) => Post.fromJson(post))
          .toList();
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      log("fetchPosts", error: errorMessage);
      throw errorMessage;
    } catch (e, t) {
      log("fetchPosts", error: e, stackTrace: t);
      rethrow;
    }
  }

  Future<Post> fetchPostDetails() async {
    try {
      final response = await ref.read(postsApiProvider).fetchPostDetails();

      return Post.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      log("fetchPostDetails", error: errorMessage);
      throw errorMessage;
    } catch (e, t) {
      log("fetchPostDetails", error: e, stackTrace: t);
      rethrow;
    }
  }

  Future<List<Comment>> fetchPostComments() async {
    try {
      final response = await ref.read(postsApiProvider).fetchPostComments();

      return (response.data as List<dynamic>)
          .map((comment) => Comment.fromJson(comment))
          .toList();
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      log("fetchPostComments", error: errorMessage);
      throw errorMessage;
    } catch (e, t) {
      log("fetchPostComments", error: e, stackTrace: t);
      rethrow;
    }
  }
}
