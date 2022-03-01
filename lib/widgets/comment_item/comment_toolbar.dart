import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/margins/margin_right10.dart';

class CommentToolbar extends StatelessWidget {
  const CommentToolbar({Key? key}) : super(key: key);

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
                    AssetsSource.messageToolbarComment,
                  ),
                ),
                Text(
                  'Trả lời',
                  style: textStyle4.copyWith(
                    fontSize: 11,
                    color: color13,
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
                    AssetsSource.likeToolbarComment,
                  ),
                ),
                Text(
                  'Thích 100',
                  style: textStyle4.copyWith(
                    fontSize: 11,
                    color: color13,
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
