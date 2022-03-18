import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/border_bottom/border_bottom_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/circular_image.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/rating_star/rating_star_widget.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import 'comment_child_item.dart';
import 'comment_toolbar.dart';

class CommentItem extends StatelessWidget {
  final dynamic model;

  const CommentItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderBottomWidget(
      widthBorder: 1,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MarginRight10(
              child: CircularImage(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarginBottom10(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleApp.textStyle5.copyWith(
                                  fontSize: 14,
                                  color: AppColor.color12,
                                ),
                              ),
                              Text(
                                "Đã tham gia 2 tháng",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleApp.textStyle2.copyWith(
                                  fontSize: 12,
                                  color: AppColor.color12,
                                ),
                              ),
                              RatingStarWidget(
                                rating: double.parse(model.rate),
                                kSizeStar: 12,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MarginRight10(
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: AppColor.color1,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                'Đã mua hàng',
                                style: TextStyleApp.textStyle2.copyWith(
                                  fontSize: 12,
                                  color: AppColor.color1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    model.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color12,
                    ),
                  ),
                  CommentToolbar(
                    like: int.parse(model.liked),
                  ),
                  // if (model.listComment != null)
                  //   Column(
                  //     children: List.generate(
                  //       model.listComment.take(4).length,
                  //       (index) => CommentChildItem(
                  //         model: model.listComment[index],
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
