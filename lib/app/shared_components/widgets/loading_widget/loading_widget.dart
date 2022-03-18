import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/assets_source/assets_path.dart';
import '../../../utils/style/text_style_app.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.3),
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
                "Đang tải tài nguyên",
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
    );
  }
}
