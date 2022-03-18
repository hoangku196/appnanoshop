import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;
import 'package:get/get.dart';
import 'package:nanoshop_app/app/features/screens/send_comment_screen/arguments/send_comment_argument_screen.dart';

import 'package:nanoshop_app/app/shared_components/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/app/shared_components/widgets/comment_item/comment_item.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../config/router/router_app.dart';
import '../../../logic/blocs/comment_bloc/comment_bloc.dart';
import '../../../logic/event/comment_event/comment_event.dart';
import '../../../logic/state/comment_state/comment_state.dart';
import '../../../shared_components/widgets/bottom_nav/bottom_nav_text.dart';
import '../../../utils/repository/comment_repository/comment_repository.dart';
import 'models/comment_filter_model.dart';

class ListRatingScreen extends StatefulWidget {
  final dynamic arguments;

  const ListRatingScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  State<ListRatingScreen> createState() => _ListRatingScreenState();
}

class _ListRatingScreenState extends State<ListRatingScreen> {
  late CommentBloc _commentBloc;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _commentBloc = CommentBloc(commentRepository: CommentRepository())
      ..add(
        InitialCommentEvent(
          type: "1",
          objectId: widget.arguments.id.toString(),
        ),
      );
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _commentBloc.add(LoadMoreListCommentEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: 'Đánh giá',
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CommentFilter(),
            FlutterBloc.BlocBuilder<CommentBloc, CommentState>(
              bloc: _commentBloc,
              builder: (context, CommentState state) {
                if (state is LoadedCommentState) {
                  if (state.listComment.isNotEmpty)
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        children: List.generate(
                          state.listComment.length,
                          (index) => CommentItem(
                            model: state.listComment[index],
                          ),
                        ),
                      ),
                    );
                  else
                    return Center(
                      child: Text(
                        'Hiện chưa có bình luận nào',
                        style: TextStyleApp.textStyle3,
                      ),
                    );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavText(
        title: 'Bình luận',
        onTap: () {
          Get.toNamed(
            RouterApp.sendCommentScreen,
            arguments: SendCommentArgumentScreen(
              id: widget.arguments.id.toString(),
            ),
          );
        },
      ),
    );
  }
}

class CommentFilter extends StatefulWidget {
  final double kSpacingItem;

  const CommentFilter({
    Key? key,
    this.kSpacingItem = 5,
  }) : super(key: key);

  @override
  _CommentFilterState createState() => _CommentFilterState();
}

class _CommentFilterState extends State<CommentFilter> {
  static const double _kPaddingContainer = 10;

  late CommentFilterModel _currentCommentFilter;

  Widget _itemRowText({
    required CommentFilterModel commentFilter,
    required Size size,
    required int length,
  }) {
    return InkWell(
      onTap: () {
        _currentCommentFilter = commentFilter;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: _currentCommentFilter == commentFilter
              ? Colors.white
              : AppColor.color28,
          borderRadius: BorderRadius.circular(5),
          border: _currentCommentFilter == commentFilter
              ? Border.all(
                  color: AppColor.color25,
                )
              : Border.all(
                  color: Colors.white,
                ),
        ),
        width: size.width / length - widget.kSpacingItem - _kPaddingContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (commentFilter.hasIcon)
              MarginRight10(
                child: Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.yellow,
                ),
              ),
            Text(
              commentFilter.title,
              style: TextStyleApp.textStyle2.copyWith(
                color: _currentCommentFilter == commentFilter
                    ? AppColor.color25
                    : AppColor.color12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentCommentFilter = dummyCommentFilterModel[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _kPaddingContainer,
        vertical: 10,
      ),
      width: size.width,
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: widget.kSpacingItem,
        alignment: WrapAlignment.spaceBetween,
        spacing: widget.kSpacingItem,
        children: [
          ...List.generate(
            dummyCommentFilterModel.take(3).length,
            (index) => _itemRowText(
              commentFilter: dummyCommentFilterModel[index],
              size: size,
              length: dummyCommentFilterModel.take(3).length,
            ),
          ),
          ...List.generate(
            dummyCommentFilterModel.where((element) => element.hasIcon).length,
            (index) => _itemRowText(
              commentFilter: dummyCommentFilterModel
                  .where((element) => element.hasIcon)
                  .toList()[index],
              size: size,
              length: dummyCommentFilterModel
                  .where((element) => element.hasIcon)
                  .toList()
                  .length,
            ),
          ),
        ],
      ),
    );
  }
}
