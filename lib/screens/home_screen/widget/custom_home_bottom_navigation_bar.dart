import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/screens/home_screen/widget/bottom_painter.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_bottom_nav.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/utils/typedef/typedef_app.dart';

class CustomHomeBottomNavigationBar extends StatefulWidget {
  final VoidCallback? callback;

  const CustomHomeBottomNavigationBar({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  _CustomHomeBottomNavigationBarState createState() =>
      _CustomHomeBottomNavigationBarState();
}

class _CustomHomeBottomNavigationBarState
    extends State<CustomHomeBottomNavigationBar> {
  int _currentIndex = 0;

  Widget buildItemNav({
    model,
    VoidCallback? callback,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        if (_currentIndex != index) {
          _currentIndex = index;
          widget.callback!(index);
        } else {
          try {
            Get.keys[model.idNav]!.currentState!.maybePop();
          } catch (e) {} finally {}
        }
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
              color: _currentIndex != index ? Colors.white : color22,
            ),
            Text(
              model.name,
              style: textStyle7.copyWith(
                color: _currentIndex != index ? Colors.white : color22,
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
                              color20,
                              color21,
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          'T',
                          style: textStyle3.copyWith(
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
                          color20,
                          color21,
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
