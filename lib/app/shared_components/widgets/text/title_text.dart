import 'package:flutter/material.dart';

import '../../../utils/style/app_color.dart';
import '../../../utils/style/text_style_app.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyleApp.textStyle2.copyWith(
        fontSize: 21,
        color: AppColor.color21,
      ),
    );
  }
}
