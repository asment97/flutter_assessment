import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Comment({
    @JsonKey(name: "postId") required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);
}
