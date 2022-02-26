import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom20.dart';

class TitleWithRouteContainer extends StatelessWidget {
  final String title;
  final String route;

  const TitleWithRouteContainer({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toUpperCase(),
          style: textStyle3.copyWith(
            color: color5,
          ),
        ),
        InkWell(
          onTap: (){
            Get.toNamed(route);
          },
          child: Text(
            'Xem tất cả',
            style: textStyle2.copyWith(
              color: color1,
            ),
          ),
        ),
      ],
    );
  }
}
