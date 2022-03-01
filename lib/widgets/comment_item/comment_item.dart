import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/border_bottom/border_bottom_widget.dart';
import 'package:nanoshop_app/widgets/comment_item/comment_child_item.dart';
import 'package:nanoshop_app/widgets/comment_item/comment_toolbar.dart';
import 'package:nanoshop_app/widgets/images/circular_image.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/widgets/rating_star/rating_star_widget.dart';

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
                                style: textStyle5.copyWith(
                                  fontSize: 14,
                                  color: color12,
                                ),
                              ),
                              Text(
                                "Đã tham gia 2 tháng",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle2.copyWith(
                                  fontSize: 12,
                                  color: color12,
                                ),
                              ),
                              RatingStarWidget(
                                rating: model.rate,
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
                                    color: color1,
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
                                style: textStyle2.copyWith(
                                  fontSize: 12,
                                  color: color1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    model.comment,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle2.copyWith(
                      color: color12,
                    ),
                  ),
                  CommentToolbar(),
                  if (model.listComment != null)
                    Column(
                      children: List.generate(
                        model.listComment.take(4).length,
                        (index) => CommentChildItem(
                          model: model.listComment[index],
                        ),
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
