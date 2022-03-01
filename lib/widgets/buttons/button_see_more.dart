import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/margins/margin_right10.dart';

class ButtonSeeMore extends StatelessWidget {
  final Function()? onTap;

  const ButtonSeeMore({
    Key? key,
    this.onTap,
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
                'Xem thêm',
                style: textStyle2.copyWith(
                  color: color27,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_outlined,
              color: color27,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
