import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/remove_focus_widget/remove_focus_widget.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../shared_components/widgets/app_bar/page_app_bar.dart';
import '../../../shared_components/widgets/bottom_nav/bottom_nav_text.dart';
import '../../../utils/style/app_color.dart';

class OrderAddressScreen extends StatefulWidget {
  const OrderAddressScreen({Key? key}) : super(key: key);

  @override
  _OrderAddressScreenState createState() => _OrderAddressScreenState();
}

class _OrderAddressScreenState extends State<OrderAddressScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PageAppBar(
          title: "Địa chỉ nhận hàng",
        ),
        body: MainMargin(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              OrderTextField(
                controller: _addressController,
                title: 'Địa chỉ giao hàng',
                hintText: 'Cầu giấy, Hà Nội',
              ),
              SizedBox(
                height: 25,
              ),
              OrderTextField(
                controller: _phoneController,
                title: 'Số điện thoại',
                hintText: '099999999',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavText(
          title: 'Lưu',
          onTap: () {
            Get.back();
          },
        ),
      ),
    );
  }
}

class OrderTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;

  const OrderTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.edit,
              color: AppColor.color10,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyleApp.textStyle7.copyWith(
                fontSize: 14,
                color: AppColor.color11,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 45,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyleApp.textStyle2.copyWith(
                color: AppColor.color10,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.color16, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.color21, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.color1, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.color1, width: 1)),
            ),
          ),
        ),
      ],
    );
  }
}
