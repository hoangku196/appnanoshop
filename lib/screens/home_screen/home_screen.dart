import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/providers/navigation_bar_provider.dart';
import 'package:nanoshop_app/screens/detail_product_screen/detail_product_screen.dart';
import 'package:nanoshop_app/screens/home_screen/page/account_page/account_page.dart';
import 'package:nanoshop_app/screens/home_screen/page/home_page/home_page.dart';
import 'package:nanoshop_app/screens/home_screen/page/news_page/news_page.dart';
import 'package:nanoshop_app/screens/home_screen/widget/custom_home_bottom_navigation_bar.dart';
import 'package:nanoshop_app/screens/menu_screen/menu_screen.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_bottom_nav.dart';
import 'package:nanoshop_app/utils/router/home_page_router.dart';
import 'package:provider/provider.dart';

import 'page/home_page/pages/category_page.dart';
import 'page/home_page/pages/search_product_page.dart';
import 'page/shopping_cart_page/shopping_cart_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NavigationBarProvider(),
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            Navigator(
              key: Get.nestedKey(dummyBottomNav[0].idNav),
              initialRoute: HomePageRouter.home,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case HomePageRouter.home:
                    return GetPageRoute(
                      settings: settings,
                      page: () => HomePage(
                        idRoute: dummyBottomNav[0].idNav,
                      ),
                    );
                  case HomePageRouter.menu:
                    return GetPageRoute(
                      settings: settings,
                      page: () => const MenuScreen(),
                      transition: Transition.rightToLeftWithFade,
                    );
                  case HomePageRouter.category:
                    return GetPageRoute(
                      settings: settings,
                      page: () => const CategoryPage(),
                      transition: Transition.rightToLeftWithFade,
                    );
                  case HomePageRouter.search:
                    return GetPageRoute(
                      settings: settings,
                      page: () => const SearchProductPage(),
                      transition: Transition.rightToLeftWithFade,
                    );
                  case HomePageRouter.detail:
                    return GetPageRoute(
                      settings: settings,
                      page: () => DetailProductScreen(
                        arguments: settings.arguments,
                      ),
                      transition: Transition.rightToLeftWithFade,
                    );
                }
              },
            ),
            NewsPage(),
            ShoppingCartPage(),
            AccountPage(),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: CustomHomeBottomNavigationBar(
          callback: (index) {
            _currentIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}
