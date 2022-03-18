import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';

class BorderBottomWidget extends StatelessWidget {
  final Widget child;
  final double widthBorder;

  const BorderBottomWidget({
    Key? key,
    required this.child,
    this.widthBorder = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColor.color23.withOpacity(0.5),
            width: widthBorder,
          ),
        ),
      ),
      child: child,
    );
  }
}
