import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  final Color color;

  const BorderContainer({
    Key? key,
    required this.child,
    this.color = AppColor.color15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
            width: 5,
          ),
        ),
      ),
      child: child,
    );
  }
}
