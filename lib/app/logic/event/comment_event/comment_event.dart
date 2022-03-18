abstract class CommentEvent {}

class InitialCommentEvent extends CommentEvent {
  final String? type, objectId, order;
  final int limit;

  InitialCommentEvent({
    this.type,
    this.order,
    this.objectId,
    this.limit = 10,
  });
}

class LoadMoreListCommentEvent extends CommentEvent {}
