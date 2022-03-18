import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/buttons/button_with_center_title.dart';

import '../../../utils/style/app_color.dart';

class BottomNavText extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const BottomNavText({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.color18,
            AppColor.color19,
          ],
        ),
      ),
      child: ButtonWithCenterTitle(
        title: title,
        onTap: onTap,
        gradient: LinearGradient(
          colors: [
            AppColor.color20,
            AppColor.color33,
          ],
        ),
      ),
    );
  }
}
