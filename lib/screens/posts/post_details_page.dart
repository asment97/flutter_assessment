import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/custom_colors.dart';
import 'package:flutter_assessment/core/models/comment.dart';
import 'package:flutter_assessment/core/providers/posts_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDetailsPage extends HookConsumerWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDetails = ref.watch(postDetailsProvider);
    final postComments = ref.watch(postCommentsProvider);
    final controller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details"),
      ),
      body: postDetails.when(
        data: (post) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    post.body,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Comments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  postComments.when(
                    data: (comments) {
                      final filteredComments =
                          useState<List<Comment>>(comments);

                      return Column(
                        children: [
                          TextFormField(
                            controller: controller,
                            decoration: InputDecoration(
                              labelText: "Search by name, email, or body",
                              suffix: controller.value.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () {
                                        controller.clear();
                                        filteredComments.value = comments;
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: CustomColors.primaryColor,
                                      ),
                                    )
                                  : null,
                            ),
                            onFieldSubmitted: (value) {
                              filteredComments.value = comments
                                  .where((element) =>
                                      element.name.contains(value) ||
                                      element.email.contains(value) ||
                                      element.body.contains(value))
                                  .toList();
                            },
                          ),
                          const SizedBox(height: 20),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${index + 1}.",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              filteredComments
                                                  .value[index].name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              filteredComments
                                                  .value[index].email,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              filteredComments
                                                  .value[index].body,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox.shrink();
                            },
                            itemCount: filteredComments.value.length,
                          ),
                        ],
                      );
                    },
                    loading: () {
                      return const SizedBox.shrink();
                    },
                    error: (error, stack) {
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        loading: () {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        error: (error, stack) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
