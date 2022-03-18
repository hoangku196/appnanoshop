import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/circular_image.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';


class CommentChildItem extends StatelessWidget {
  final dynamic model;

  const CommentChildItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarginBottom10(
      child: Row(
        children: [
          MarginRight10(
            child: CircularImage(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.color29,
              ),
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
                    model.comment,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color12,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
