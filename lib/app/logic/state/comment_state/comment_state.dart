import 'package:nanoshop_app/app/utils/models/comment_response.dart';

class CommentState {}

class LoadingCommentState extends CommentState {}

class LoadedCommentState extends CommentState {
  final List<CommentResponse> listComment;
  final bool hasMore;

  LoadedCommentState({
    required this.listComment,
    required this.hasMore,
  });
}
