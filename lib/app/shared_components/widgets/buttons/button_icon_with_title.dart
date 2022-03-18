import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class ButtonIconWithTitle extends StatelessWidget {
  final String title;
  final String assetsSource;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onTap;

  const ButtonIconWithTitle({
    Key? key,
    required this.title,
    required this.assetsSource,
    this.onTap,
    this.borderColor = Colors.white,
    this.backgroundColor = AppColor.color1,
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
          border: Border.all(color: borderColor,width: 0.5),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MarginRight10(
              child: Image.asset(assetsSource),
            ),
            Center(
              child: Text(
                title,
                style: TextStyleApp.textStyle2.copyWith(
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
