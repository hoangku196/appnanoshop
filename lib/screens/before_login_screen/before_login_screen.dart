import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/animations/ease_out_from_bottom_animation.dart';
import 'package:nanoshop_app/animations/ease_out_from_right_animation.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/router/router_app.dart';
import 'package:nanoshop_app/widgets/buttons/button_with_center_title.dart';

class BeforeLoginScreen extends StatelessWidget {
  const BeforeLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 70),
              child: EaseOutFromRightAnimation(
                child: Image.asset(
                  AssetsSource.appIcon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70, right: 70, bottom: 20),
              child: ButtonWithCenterTitle(
                onTap: (){
                  Get.toNamed(RouterApp.loginScreen);
                },
                title: 'Đăng nhập',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70, right: 70),
              child: EaseOutFromBottomAnimation(
                child: ButtonWithCenterTitle(
                  title: 'Đăng ký',
                  textColor: color1,
                  backgroundColor: Colors.white,
                  borderColor: color1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
