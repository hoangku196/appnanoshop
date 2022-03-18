import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/animations/ease_out_from_bottom_animation.dart';
import 'package:nanoshop_app/app/shared_components/animations/ease_out_from_right_animation.dart';
import 'package:nanoshop_app/app/shared_components/widgets/background_app/background_app.dart';
import 'package:nanoshop_app/app/shared_components/widgets/buttons/button_with_center_title.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';

class BeforeLoginScreen extends StatelessWidget {
  const BeforeLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: BackgroundApp(),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: EaseOutFromRightAnimation(
                    child: Image.asset(
                      AssetsPath.appIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 70, right: 70, bottom: 20),
                  child: ButtonWithCenterTitle(
                    onTap: () {
                      Get.toNamed(RouterApp.loginScreen);
                    },
                    title: 'Đăng nhập',
                    gradient: LinearGradient(
                      colors: [
                        AppColor.color20,
                        AppColor.color33,
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 70, right: 70),
                  child: EaseOutFromBottomAnimation(
                    child: ButtonWithCenterTitle(
                      onTap: () {
                        Get.toNamed(RouterApp.signInScreen);
                      },
                      title: 'Đăng ký',
                      textColor: AppColor.color33,
                      backgroundColor: Colors.white,
                      borderColor: AppColor.color1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
