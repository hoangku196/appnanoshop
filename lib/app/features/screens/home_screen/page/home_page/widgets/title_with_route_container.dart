import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/app/utils/typedef/typedef_app.dart';


class TitleWithRouteContainer extends StatelessWidget {
  final String title;
  final CallbackScreen callbackScreen;
  final Color textColor;

  const TitleWithRouteContainer({
    Key? key,
    required this.title,
    required this.callbackScreen,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyleApp.textStyle3.copyWith(
            color: textColor,
          ),
        ),
        InkWell(
          onTap: callbackScreen,
          child: Text(
            'Xem tất cả',
            style: TextStyleApp.textStyle2.copyWith(
              color: AppColor.color21,
            ),
          ),
        ),
      ],
    );
  }
}
