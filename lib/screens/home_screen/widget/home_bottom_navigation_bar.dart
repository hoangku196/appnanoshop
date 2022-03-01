import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/providers/navigation_bar_provider.dart';
import 'package:nanoshop_app/utils/global_key/global_key_app.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:provider/provider.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationBarProvider>(
      builder: (context, _model, child) => Container(
        color: Colors.white,
        height: 63,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _model.listBottomNavigationBarItem.map(
              (e) {
                return InkWell(
                  onTap: () {
                    if (_model.currentTab != e.index)
                      _model.setCurrentTab(e.index);
                    if (_model.currentTab == 0) {
                      try {
                        Get.keys[GlobalKeyApp.idHomeAppNav]!.currentState!
                            .maybePop();
                      } catch (e) {}
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          e.hasProvider
                              ? Badge(
                                  badgeContent: Text('1'),
                                  child: Image.asset(
                                    e.assetsSource,
                                    color: _model.currentTab == e.index
                                        ? color1
                                        : color7,
                                  ),
                                )
                              : Image.asset(
                                  e.assetsSource,
                                  color: _model.currentTab == e.index
                                      ? color1
                                      : color7,
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        e.title,
                        style: textStyle2.copyWith(
                          fontSize: 10,
                          color: _model.currentTab == e.index ? color1 : color7,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
