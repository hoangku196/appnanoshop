import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class CommentToolbar extends StatelessWidget {
  final int like;

  const CommentToolbar({
    Key? key,
    required this.like,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                MarginRight10(
                  child: Image.asset(
                    AssetsPath.messageToolbarComment,
                  ),
                ),
                Text(
                  'Trả lời',
                  style: TextStyleApp.textStyle4.copyWith(
                    fontSize: 11,
                    color: AppColor.color13,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                MarginRight10(
                  child: Image.asset(
                    AssetsPath.likeToolbarComment,
                  ),
                ),
                Text(
                  'Thích ${like > 0 ? like : ''}',
                  style: TextStyleApp.textStyle4.copyWith(
                    fontSize: 11,
                    color: AppColor.color13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
