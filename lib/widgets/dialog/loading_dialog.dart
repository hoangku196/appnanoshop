import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/router/router_app.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';

class LoadingDialog {
  static Future<void> createLoadingDialog({
    required BuildContext context,
    required Future future,
    String text = "Loading...",
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
                      AssetsSource.appIcon,
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
                  textStyle: textStyle2.copyWith(
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

    await future.then((value) {
      print(value);
    });

    // Get.back();
  }
}
