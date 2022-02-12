import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';

class ButtonWithCenterTitle extends StatelessWidget {
  final String title;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onTap;

  const ButtonWithCenterTitle({
    Key? key,
    required this.title,
    this.onTap,
    this.borderColor = Colors.white,
    this.backgroundColor = color1,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle1.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
