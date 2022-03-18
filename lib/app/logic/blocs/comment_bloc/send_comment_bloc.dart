import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nanoshop_app/app/logic/event/comment_event/send_comment_event.dart';
import 'package:nanoshop_app/app/logic/state/comment_state/send_comment_state.dart';
import 'package:nanoshop_app/app/utils/repository/comment_repository/comment_repository.dart';

import '../../../constants/strings_constant/strings_constant.dart';

class SendCommentBloc extends Bloc<SendCommentEvent, SendCommentState> {
  CommentRepository commentRepository;

  SendCommentBloc({
    required this.commentRepository,
  }) : super(SendCommentState());

  @override
  Stream<SendCommentState> mapEventToState(SendCommentEvent event) async* {
    if (event is Send) {
      yield Sending();
      try {
        await commentRepository.sendComment(
          content: event.content,
          emailPhone: event.emailPhone,
          objectId: event.objectId,
          name: event.name,
          countRate: event.countRate,
          type: event.type,
        );

        yield SendSuccess();
      } on PlatformException {
        yield SendFailure(
          error: StringsConstant.connectError,
        );
      } catch (e) {
        yield SendFailure(
          error: e.toString(),
        );
      }
    }

    if (event is CloseSendFailureDialog) {
      yield SendCommentState();
    }
  }
}
