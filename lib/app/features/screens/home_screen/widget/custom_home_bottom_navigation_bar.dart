import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_bottom_nav.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/app/utils/typedef/typedef_app.dart';

import 'bottom_painter.dart';

class CustomHomeBottomNavigationBar extends StatelessWidget {
  final VoidCallback? callback;

  final int currentIndex;

  const CustomHomeBottomNavigationBar({
    Key? key,
    required this.callback,
    required this.currentIndex,
  }) : super(key: key);

  Widget buildItemNav({
    model,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        callback!(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              model.url,
              color: currentIndex != index ? Colors.white : AppColor.color22,
            ),
            Text(
              model.name,
              style: TextStyleApp.textStyle7.copyWith(
                color: currentIndex != index ? Colors.white : AppColor.color22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              color: Colors.transparent,
              child: CustomPaint(
                size: Size(size.width, 80),
                painter: BottomPainter(),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColor.color20,
                              AppColor.color21,
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          'T',
                          style: TextStyleApp.textStyle3.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColor.color20,
                          AppColor.color21,
                        ],
                      ).createShader(bounds);
                    },
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItemNav(
                    model: dummyBottomNav[0],
                    index: 0,
                  ),
                  buildItemNav(
                    model: dummyBottomNav[1],
                    index: 1,
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  ),
                  buildItemNav(
                    model: dummyBottomNav[2],
                    index: 2,
                  ),
                  buildItemNav(
                    model: dummyBottomNav[3],
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
