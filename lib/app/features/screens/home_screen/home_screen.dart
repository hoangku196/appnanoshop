import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;
import 'package:get/get.dart';

import 'package:nanoshop_app/app/config/router/home_page_router.dart';
import 'package:nanoshop_app/app/config/router/news_page_router.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/account_page/account_page.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/home_page/home_page.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/news_page/news_page.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/widget/custom_home_bottom_navigation_bar.dart';
import 'package:nanoshop_app/app/features/screens/menu_screen/menu_screen.dart';
import 'package:nanoshop_app/app/logic/event/banner_event/banner_event.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_bottom_nav.dart';
import 'package:provider/provider.dart';

import '../../../logic/blocs/banner_bloc/banner_bloc.dart';
import '../../../utils/repository/banner_respository/banner_repository.dart';
import '../../providers/shopping_cart_provider.dart';
import '../notification_screen/notification_screen.dart';
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

  _loadShoppingCart() {
    final shoppingCartProvider =
    Provider.of<ShoppingCartProvider>(context, listen: false);
    shoppingCartProvider.loadShoppingCart();
  }

  @override
  void initState() {
    super.initState();
    _loadShoppingCart();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    page: () => CategoryPage(
                      arguments: settings.arguments,
                    ),
                    transition: Transition.rightToLeftWithFade,
                  );
                case HomePageRouter.search:
                  return GetPageRoute(
                    settings: settings,
                    page: () => SearchProductPage(),
                    transition: Transition.rightToLeftWithFade,
                  );
                // case HomePageRouter.detail:
                //   return GetPageRoute(
                //     settings: settings,
                //     page: () => DetailProductScreen(
                //       arguments: settings.arguments,
                //     ),
                //     transition: Transition.rightToLeftWithFade,
                //   );
              }
            },
          ),
          Navigator(
            key: Get.nestedKey(dummyBottomNav[1].idNav),
            initialRoute: NewsPageRouter.newsPage,
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case NewsPageRouter.newsPage:
                  return GetPageRoute(
                    settings: settings,
                    page: () => NewsPage(
                      idRoute: dummyBottomNav[1].idNav,
                    ),
                  );
                // case NewsPageRouter.detail:
                //   return GetPageRoute(
                //     settings: settings,
                //     page: () => NewsPage(
                //       idRoute: dummyBottomNav[1].idNav,
                //     ),
                //   );
                // case HomePageRouter.detail:
                //   return GetPageRoute(
                //     settings: settings,
                //     page: () => DetailProductScreen(
                //       arguments: settings.arguments,
                //     ),
                //     transition: Transition.rightToLeftWithFade,
                //   );
              }
            },
          ),
          NotificationScreen(),
          AccountPage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: CustomHomeBottomNavigationBar(
        callback: (index) {
          if (_currentIndex != index) {
            _currentIndex = index;
            setState(() {});
          } else {
            try {
              Get.keys[dummyBottomNav[index].idNav]!.currentState!.maybePop();
            } catch (e) {
            } finally {}
          }
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
