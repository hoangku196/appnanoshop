import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_attribute.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class RowItemAttribute extends StatefulWidget {
  final Function()? onTap;

  const RowItemAttribute({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  _RowItemAttributeState createState() => _RowItemAttributeState();
}

class _RowItemAttributeState extends State<RowItemAttribute> {
  var _currentIndex = 0;

  Widget _itemAttribute({
    model,
    required int index,
  }) {
    return MarginRight10(
      child: InkWell(
        onTap: () {
          _currentIndex = index;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: _currentIndex == index ? AppColor.color27 : AppColor.color29,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            model.name,
            style: TextStyleApp.textStyle1.copyWith(
              color: _currentIndex == index ? Colors.white : AppColor.color13,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        dummyAttribute.length,
        (index) => _itemAttribute(
          index: index,
          model: dummyAttribute[index],
        ),
      ),
    );
  }
}
