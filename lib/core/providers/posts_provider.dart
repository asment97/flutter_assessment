import 'package:flutter_assessment/core/models/comment.dart';
import 'package:flutter_assessment/core/models/post.dart';
import 'package:flutter_assessment/core/repositories/posts_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedPostIdProvider = StateProvider<int?>(((ref) => null));

final postsProvider = FutureProvider.autoDispose<List<Post>>(
  (ref) async {
    return await ref.watch(postsRepositoryProvider).fetchPosts();
  },
);

final postDetailsProvider = FutureProvider.autoDispose<Post>(
  (ref) async {
    return await ref.watch(postsRepositoryProvider).fetchPostDetails();
  },
);

final postCommentsProvider = FutureProvider.autoDispose<List<Comment>>(
  (ref) async {
    return await ref.watch(postsRepositoryProvider).fetchPostComments();
  },
);
