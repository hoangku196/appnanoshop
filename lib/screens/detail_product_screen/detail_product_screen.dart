import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/screens/detail_product_screen/arguments/detail_product_argument_screen.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_comment.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_image.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/border_bottom/border_bottom_widget.dart';
import 'package:nanoshop_app/widgets/buttons/button_see_more.dart';
import 'package:nanoshop_app/widgets/comment_item/comment_item.dart';
import 'package:nanoshop_app/widgets/favourite_icon_widget/favourite_icon_widget.dart';
import 'package:nanoshop_app/widgets/list_horizontal_product/list_horizontal_product.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/widgets/rating_star/rating_star_widget.dart';
import 'package:nanoshop_app/widgets/slider_image/detail_product_slider_image.dart';

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

  @override
  void initState() {
    super.initState();
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );
    _colorTween = ColorTween(
      begin: Colors.transparent,
      end: Colors.blue,
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
                      child: const DetailProductSliderImage(),
                    ),
                    NameProduct(
                      model: widget.arguments.model,
                    ),
                    const ShareListWidget(),
                    DetailWithTittleProductFragment(
                      title: 'chi tiết sản phẩm',
                    ),
                    DetailWithTittleProductFragment(
                      title: 'mô tả sản phẩm',
                    ),
                    RatingProductFragment(),
                    ListHorizontalProduct(
                      title: 'sản phẩm tương tự',
                    ),
                    ListHorizontalProduct(
                      title: 'sản phẩm đã xem',
                    ),
                    Container(
                      height: 500,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _colorAnimationController,
              builder: (context, child) => Column(
                children: [
                  Container(
                    color: _colorTween.value,
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: _colorTween.value,
                    child: Row(
                      children: [
                        Platform.isAndroid
                            ? Icon(
                                Icons.arrow_back,
                              )
                            : Icon(
                                Icons.arrow_back_ios,
                              ),
                      ],
                    ),
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

class RatingProductFragment extends StatelessWidget {
  const RatingProductFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        style: textStyle2.copyWith(
                          color: color12,
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
                                    style: textStyle3.copyWith(
                                      color: color25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '(100 đánh giá)',
                              style: textStyle4.copyWith(
                                color: color12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MarginBottom10(
                      child: Text(
                        'tất cả hình ảnh (88)'.toUpperCase(),
                        style: textStyle2.copyWith(
                          color: color12,
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
                                  MediaQuery.of(context).size.width / 4 - 20,
                              height:
                                  MediaQuery.of(context).size.width / 4 - 20,
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
                                  color: color19.withOpacity(0.3),
                                  child: Center(
                                    child: Text(
                                      '+ ${dummyImage.length - 4}',
                                      style: textStyle1.copyWith(
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
          if (dummyComment.isNotEmpty)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: List.generate(
                  dummyComment.take(4).length,
                  (index) => CommentItem(
                    model: dummyComment[index],
                  ),
                ),
              ),
            ),
          ButtonSeeMore(),
        ],
      ),
    );
  }
}

class DetailWithTittleProductFragment extends StatelessWidget {
  final String title;

  const DetailWithTittleProductFragment({
    Key? key,
    required this.title,
  }) : super(key: key);

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
                    color: color28,
                  ),
                  child: Text(
                    title.toUpperCase(),
                    style: textStyle2.copyWith(
                      color: color11,
                    ),
                  ),
                ),
              ),
            ),
            ButtonSeeMore(),
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
                    style: textStyle2.copyWith(
                      color: color12,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(AssetsSource.twitterDetailProductIcon),
                        Image.asset(AssetsSource.pinterestDetailProductIcon),
                        Image.asset(AssetsSource.messengerDetailProductIcon),
                        Image.asset(AssetsSource.gmailDetailProductIcon),
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
                    iconDisabledColor: color12.withOpacity(0.3),
                    iconColor: color25,
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
                          model.title,
                          style: textStyle2.copyWith(
                            fontSize: 16,
                            color: color24,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: color21,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '10%',
                          style: textStyle7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: color21.withOpacity(0.1),
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
                                    model.price.toString(),
                                    style: textStyle3.copyWith(
                                      color: color25,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    model.priceSale.toString(),
                                    style: textStyle4.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: color13,
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
                              color: color25,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Giảm 15%',
                              style: textStyle7.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Giá tốt nhất so với các sản phẩm trên thị trường',
                      style: textStyle4.copyWith(
                        color: color12,
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
                                style: textStyle2.copyWith(
                                  color: color12,
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
                          color: color12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Bình luận 255',
                          textAlign: TextAlign.center,
                          style: textStyle2.copyWith(
                            color: color12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: VerticalDivider(
                          color: color12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Đã bán 2k3',
                          textAlign: TextAlign.center,
                          style: textStyle2.copyWith(
                            color: color12,
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
                        child:
                            Image.asset(AssetsSource.insureDetailProductIcon),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Tatra ",
                              style: textStyle2.copyWith(
                                color: color27,
                              ),
                            ),
                            TextSpan(
                              text: "đảm bảo",
                              style: textStyle2.copyWith(
                                color: color24,
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
                    style: textStyle2.copyWith(
                      color: color27,
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
