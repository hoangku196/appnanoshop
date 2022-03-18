import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/background_app/background_app.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../utils/style/app_color.dart';
import '../buttons/button_with_center_title.dart';

class LoadingFailed extends StatelessWidget {
  final String error;
  final Function()? onTap;

  const LoadingFailed({
    Key? key,
    required this.error,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: BackgroundApp(),
        ),
        Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 150,
                color: Colors.red,
              ),
              MarginBottom10(
                child: Text(
                  'Lỗi hệ thống !!!',
                  textAlign: TextAlign.center,
                  style: TextStyleApp.textStyle5.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
              MarginBottom10(
                child: Text(
                  error,
                  textAlign: TextAlign.center,
                  style: TextStyleApp.textStyle5,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 70, right: 70, bottom: 20),
                child: ButtonWithCenterTitle(
                  onTap: onTap,
                  title: 'Thử lại',
                  gradient: LinearGradient(
                    colors: [
                      AppColor.color20,
                      AppColor.color33,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
