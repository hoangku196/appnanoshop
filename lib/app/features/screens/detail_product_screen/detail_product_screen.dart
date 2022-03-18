import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;

import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/features/screens/detail_product_screen/widgets/bottom_detail_product_nav_bar.dart';
import 'package:nanoshop_app/app/features/screens/list_rating_screen/arguments/list_rating_argument_screen.dart';
import 'package:nanoshop_app/app/logic/blocs/comment_bloc/comment_bloc.dart';
import 'package:nanoshop_app/app/logic/event/comment_event/comment_event.dart';
import 'package:nanoshop_app/app/logic/state/comment_state/comment_state.dart';
import 'package:nanoshop_app/app/shared_components/widgets/border_bottom/border_bottom_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/buttons/button_see_more.dart';
import 'package:nanoshop_app/app/shared_components/widgets/comment_item/comment_item.dart';
import 'package:nanoshop_app/app/shared_components/widgets/favourite_icon_widget/favourite_icon_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/list_horizontal_product/list_horizontal_product.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/rating_star/rating_star_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/slider_image/detail_product_slider_image.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_comment.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_image.dart';
import 'package:nanoshop_app/app/utils/repository/comment_repository/comment_repository.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../utils/helpers/helper_function.dart';

class DetailProductScreen extends StatefulWidget {
  final dynamic arguments;

  const DetailProductScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _colorAnimationController;
  late Animation _colorTween;
  late Animation _opacityTween;

  late CommentBloc _commentBloc;

  @override
  void initState() {
    super.initState();
    _commentBloc = CommentBloc(commentRepository: CommentRepository())
      ..add(
        InitialCommentEvent(
          type: "1",
          objectId: widget.arguments.model.id.toString(),
          limit: 5,
        ),
      );
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );
    _colorTween = ColorTween(
      begin: AppColor.color27,
      end: Colors.white,
    ).animate(_colorAnimationController);
    _opacityTween = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(_colorAnimationController);
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    _colorAnimationController
        .animateTo(_scrollController.position.pixels / 400);
  }

  @override
  void dispose() {
    super.dispose();
    _colorAnimationController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    MarginBottom10(
                      child: DetailProductSliderImage(
                        images: widget.arguments.model.listImage,
                      ),
                    ),
                    NameProduct(
                      model: widget.arguments.model,
                    ),
                    const ShareListWidget(),
                    DetailWithTittleProductFragment(
                      title: 'chi tiết sản phẩm',
                      model: widget.arguments.model,
                    ),
                    DetailWithTittleProductFragment(
                      title: 'mô tả sản phẩm',
                      model: widget.arguments.model,
                    ),
                    RatingProductFragment(
                      commentBloc: _commentBloc,
                      model: widget.arguments.model,
                    ),
                    ListHorizontalProduct(
                      title: 'sản phẩm tương tự',
                    ),
                    ListHorizontalProduct(
                      title: 'sản phẩm đã xem',
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _colorAnimationController,
                builder: (context, child) => Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Opacity(
                        opacity: _opacityTween.value,
                        child: Image.asset(
                          AssetsPath.backgroundAppBar,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            children: [
                              Platform.isAndroid
                                  ? InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: _colorTween.value,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: _colorTween.value,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomDetailProductNavBar(
        model: widget.arguments.model,
      ),
    );
  }
}

class RatingProductFragment extends StatelessWidget {
  final CommentBloc commentBloc;
  final dynamic model;

  const RatingProductFragment({
    Key? key,
    required this.commentBloc,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterBloc.BlocBuilder<CommentBloc, CommentState>(
      bloc: commentBloc,
      builder: (context, CommentState state) {
        if (state is LoadedCommentState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BorderBottomWidget(
                    widthBorder: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MarginBottom10(
                            child: Text(
                              'đánh giá sản phẩm'.toUpperCase(),
                              style: TextStyleApp.textStyle2.copyWith(
                                color: AppColor.color12,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          MarginBottom10(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: RatingStarWidget(rating: 3.5),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '3.5/5',
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyleApp.textStyle3.copyWith(
                                            color: AppColor.color25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '(100 đánh giá)',
                                    style: TextStyleApp.textStyle4.copyWith(
                                      color: AppColor.color12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MarginBottom10(
                            child: Text(
                              'tất cả hình ảnh (88)'.toUpperCase(),
                              style: TextStyleApp.textStyle2.copyWith(
                                color: AppColor.color12,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              dummyImage.take(4).length,
                              (index) => Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4 -
                                            20,
                                    height:
                                        MediaQuery.of(context).size.width / 4 -
                                            20,
                                    child: Image.asset(
                                      dummyImage[index].url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  if (dummyImage.length > 4 && index == 3)
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        color:
                                            AppColor.color19.withOpacity(0.3),
                                        child: Center(
                                          child: Text(
                                            '+ ${dummyImage.length - 4}',
                                            style: TextStyleApp.textStyle1
                                                .copyWith(
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.listComment.isNotEmpty)
                  Container(
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
                  ),
                ButtonSeeMore(
                  onTap: () {
                    Get.toNamed(
                      RouterApp.listRatingScreen,
                      arguments: ListRatingArgumentScreen(id: model.id),
                    );
                  },
                  isActive: false,
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}

class DetailWithTittleProductFragment extends StatefulWidget {
  final String title;
  final dynamic model;

  const DetailWithTittleProductFragment({
    Key? key,
    required this.title,
    required this.model,
  }) : super(key: key);

  @override
  State<DetailWithTittleProductFragment> createState() =>
      _DetailWithTittleProductFragmentState();
}

class _DetailWithTittleProductFragmentState
    extends State<DetailWithTittleProductFragment> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return BorderBottomWidget(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BorderBottomWidget(
              widthBorder: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColor.color28,
                  ),
                  child: Text(
                    widget.title.toUpperCase(),
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color11,
                    ),
                  ),
                ),
              ),
            ),
            Html(
              data: _isActive
                  ? widget.model.productDescBk
                  : widget.model.productSortdescBk,
            ),
            ButtonSeeMore(
              isActive: _isActive,
              onTap: () {
                _isActive = !_isActive;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShareListWidget extends StatelessWidget {
  const ShareListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderBottomWidget(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Chia sẻ:',
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color12,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(AssetsPath.twitterDetailProductIcon),
                        Image.asset(AssetsPath.pinterestDetailProductIcon),
                        Image.asset(AssetsPath.messengerDetailProductIcon),
                        Image.asset(AssetsPath.gmailDetailProductIcon),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FavouriteIconWidget(
                    iconSize: 40,
                    iconDisabledColor: AppColor.color12.withOpacity(0.3),
                    iconColor: AppColor.color25,
                    valueChanged: (value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameProduct extends StatelessWidget {
  final dynamic model;

  const NameProduct({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BorderBottomWidget(
          child: Column(
            children: [
              MarginBottom10(
                child: MainMargin(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          model.name,
                          style: TextStyleApp.textStyle2.copyWith(
                            fontSize: 16,
                            color: AppColor.color24,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColor.color21,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '10%',
                          style: TextStyleApp.textStyle7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: AppColor.color21.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MarginBottom10(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    Helper.convertPrice(
                                        double.parse(model.price).round()),
                                    style: TextStyleApp.textStyle3.copyWith(
                                      color: AppColor.color25,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    Helper.convertPrice(
                                        double.parse(model.priceMarket)
                                            .round()),
                                    style: TextStyleApp.textStyle4.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: AppColor.color13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColor.color25,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Giảm 15%',
                              style: TextStyleApp.textStyle7.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Giá tốt nhất so với các sản phẩm trên thị trường',
                      style: TextStyleApp.textStyle4.copyWith(
                        color: AppColor.color12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '3.5',
                                style: TextStyleApp.textStyle2.copyWith(
                                  color: AppColor.color12,
                                ),
                              ),
                            ),
                            RatingStarWidget(
                              rating: 3.5,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: VerticalDivider(
                          color: AppColor.color12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Bình luận 255',
                          textAlign: TextAlign.center,
                          style: TextStyleApp.textStyle2.copyWith(
                            color: AppColor.color12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: VerticalDivider(
                          color: AppColor.color12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Đã bán 2k3',
                          textAlign: TextAlign.center,
                          style: TextStyleApp.textStyle2.copyWith(
                            color: AppColor.color12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BorderBottomWidget(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MarginRight10(
                        child: Image.asset(AssetsPath.insureDetailProductIcon),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Tatra ",
                              style: TextStyleApp.textStyle2.copyWith(
                                color: AppColor.color27,
                              ),
                            ),
                            TextSpan(
                              text: "đảm bảo",
                              style: TextStyleApp.textStyle2.copyWith(
                                color: AppColor.color24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    'Hàng chính hãng',
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color27,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
