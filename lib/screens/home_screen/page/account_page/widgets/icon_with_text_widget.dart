import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String title;

  const IconWithText({
    Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: color5,
          size: 14,
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          title,
          style: textStyle1.copyWith(
            color: color5,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
