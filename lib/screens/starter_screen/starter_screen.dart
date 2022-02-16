import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/animations/ease_out_from_left_animation.dart';
import 'package:nanoshop_app/animations/ease_out_from_right_animation.dart';

import 'package:nanoshop_app/screens/starter_screen/widgets/indicator_page_view.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/router/router_app.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  _StarterScreenState createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;

  final _initialPage = 0;

  late final List<Widget> _page = [
    Image.asset(
      'assets/images/demo_anh_1.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/demo_anh_1.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/demo_anh_1.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/demo_anh_1.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/demo_anh_1.png',
      fit: BoxFit.cover,
    ),
  ];

  late int _indexPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _initialPage,
      keepPage: true,
    );
    _indexPage = _initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: EaseOutFromLeftAnimation(
              delay: 0,
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  _indexPage = page;
                  setState(() {});
                },
                children: _page,
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 10,
            right: 0,
            child: EaseOutFromRightAnimation(
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _page.length,
                        (index) {
                          return IndicatorPageView(
                            isActive: index == _indexPage ? true : false,
                            onTap: () {
                              if (_indexPage != index) {
                                _pageController.animateToPage(index,
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.fastOutSlowIn);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        Get.offAndToNamed(RouterApp.beforeLoginScreen);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: color1,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: color1,
                        ),
                      ),
                    ),
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
