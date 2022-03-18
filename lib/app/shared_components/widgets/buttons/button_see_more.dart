import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class ButtonSeeMore extends StatelessWidget {
  final bool isActive;

  final Function()? onTap;

  const ButtonSeeMore({
    Key? key,
    this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MarginRight10(
              child: Text(
                isActive ? "Rút gọn" : 'Xem thêm',
                style: TextStyleApp.textStyle2.copyWith(
                  color: AppColor.color27,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_outlined,
              color: AppColor.color27,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
