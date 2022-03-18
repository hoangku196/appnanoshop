import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../constants/assets_source/assets_path.dart';

class PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const PageAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = AppColor.color5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            AssetsPath.backgroundAppBar,
            fit: BoxFit.fill,
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          title: Text(
            title,
            style: TextStyleApp.textStyle1,
          ),
          centerTitle: true,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
