import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';

class IndicatorPageView extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inActiveColor;
  final Function()? onTap;
  final double width;
  final double height;

  const IndicatorPageView({
    Key? key,
    required this.isActive,
    this.onTap,
    this.width = 16,
    this.height = 8,
    this.activeColor = AppColor.color1,
    this.inActiveColor = AppColor.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isActive ? AppColor.color21 : AppColor.color21.withOpacity(0.3),
        ),
      ),
    );
  }
}
