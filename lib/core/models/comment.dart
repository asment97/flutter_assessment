import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Post({
    @JsonKey(name: "postId") required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}
