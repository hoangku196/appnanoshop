import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/widgets/buttons/button_with_center_title.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../utils/style/app_color.dart';

class LoadingDialog {
  static Future<void> createLoadingDialog({
    required BuildContext context,
    String text = "Đang tải...",
  }) async {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 60.0,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      AssetsPath.appIcon,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  text,
                  textStyle: TextStyleApp.textStyle2.copyWith(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
              isRepeatingAnimation: true,
            )
          ],
        ),
      ),
    );
  }

  static Future<void> createFailedDialog({
    required BuildContext context,
    required String error,
    String buttonTitle = "Đóng",
  }) async {
    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              error,
              style: TextStyleApp.textStyle5,
            ),
            ButtonWithCenterTitle(
              title: buttonTitle,
              gradient: LinearGradient(
                colors: [
                  AppColor.color20,
                  AppColor.color33,
                ],
              ),
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
