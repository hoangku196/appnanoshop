import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoshop_app/app/logic/event/comment_event/comment_event.dart';
import 'package:nanoshop_app/app/logic/state/comment_state/comment_state.dart';
import 'package:nanoshop_app/app/utils/models/comment_response.dart';
import 'package:nanoshop_app/app/utils/repository/comment_repository/comment_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;

  int _page = 1;

  List<CommentResponse> _listComment = [];

  bool _hasMore = true;

  String? _type, _objectId, _order;

  int _limit = 10;

  CommentBloc({
    required this.commentRepository,
  }) : super(CommentState());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is InitialCommentEvent) {
      yield LoadingCommentState();
      try {
        _type = event.type;
        _objectId = event.objectId;
        _order = event.order;
        _limit = event.limit;
        List<CommentResponse> data = await commentRepository.getListComment(
          page: _page,
          limit: _limit,
          type: _type ?? '1',
          objectId: _objectId ?? '1',
          order: _order,
        );

        if (data.isNotEmpty) {
          _listComment.addAll(data);
        } else {
          _hasMore = false;
        }

        if (_listComment.length < _limit) {
          _hasMore = false;
        }

        yield LoadedCommentState(
          hasMore: _hasMore,
          listComment: _listComment,
        );
      } catch (e) {}
    }

    if (event is LoadMoreListCommentEvent) {
      try {
        print("_page");
        print(_page);
        List<CommentResponse> data = await commentRepository.getListComment(
          page: ++_page,
          limit: _limit,
          type: _type ?? '1',
          objectId: _objectId ?? '1',
          order: _order,
        );

        if (data.isNotEmpty) {
          _listComment.addAll(data);
        } else {
          _hasMore = false;
        }

        if (_listComment.length < 10) {
          _hasMore = false;
        }
        yield LoadedCommentState(
          hasMore: _hasMore,
          listComment: _listComment,
        );
      } catch (e) {}
    }
  }

  refreshList() async {
    _hasMore = true;
    _page = 1;
    _listComment.clear();
    try {
      List<CommentResponse> data = await commentRepository.getListComment(
        page: _page,
        limit: _limit,
        type: _type ?? '1',
        objectId: _objectId ?? '1',
        order: _order,
      );

      if (data.isNotEmpty) {
        _listComment.addAll(data);
      } else {
        _hasMore = false;
      }

      if (_listComment.length < 10) {
        _hasMore = false;
      }

      emit(
        LoadedCommentState(
          hasMore: _hasMore,
          listComment: _listComment,
        ),
      );
    } catch (e) {
      emit(state);
    }
  }
}
