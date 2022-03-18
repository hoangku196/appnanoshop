import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';

class CircleCheckBox extends StatelessWidget {
  final Function()? onTap;
  final bool isSelected;
  final Color color;

  CircleCheckBox({
    this.onTap,
    required this.isSelected,
    this.color = AppColor.color21,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.withOpacity(0.3),
          border: !isSelected ? Border.all(color: Colors.grey, width: 1) : null,
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? Icon(
          Icons.check,
          color: AppColor.color1,
          size: 14,
        )
            : null,
      ),
    );
  }
}
