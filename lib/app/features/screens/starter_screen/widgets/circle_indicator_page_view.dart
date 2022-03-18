import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';

class CircleIndicatorPageView extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inActiveColor;
  final Function()? onTap;
  final double width;
  final double height;

  const CircleIndicatorPageView({
    Key? key,
    required this.isActive,
    this.onTap,
    this.width = 12,
    this.height = 12,
    this.activeColor = Colors.white,
    this.inActiveColor = AppColor.color13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: isActive ? width : width * 0.8,
        height: isActive ? height : height * 0.8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? activeColor : inActiveColor.withOpacity(0.6),
        ),
      ),
    );
  }
}
