class SendCommentState {}

class Sending extends SendCommentState {}

class SendSuccess extends SendCommentState {}

class SendFailure extends SendCommentState {
  var error;

  SendFailure({this.error});
}
