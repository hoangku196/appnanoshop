import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/screens/home_screen/home_screen.dart';
import 'package:nanoshop_app/screens/home_screen/page/home_page/fragment/category_fragment.dart';
import 'package:nanoshop_app/screens/home_screen/page/home_page/fragment/search_product_fragment.dart';
import 'package:nanoshop_app/screens/list_product_screen.dart';
import 'package:nanoshop_app/screens/login_screen/login_screen.dart';
import 'package:nanoshop_app/screens/menu_screen/menu_screen.dart';
import 'package:nanoshop_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:nanoshop_app/utils/router/router_app.dart';

import 'package:nanoshop_app/screens/before_login_screen/before_login_screen.dart';
import 'screens/starter_screen/starter_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouterApp.starterScreen,
      getPages: [
        GetPage(
          name: RouterApp.starterScreen,
          page: () => StarterScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouterApp.beforeLoginScreen,
          page: () => BeforeLoginScreen(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: RouterApp.loginScreen,
          page: () => LoginScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouterApp.signInScreen,
          page: () => SignInScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouterApp.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.topLevel,
        ),
        GetPage(
          name: RouterApp.categoryFragment,
          page: () => CategoryFragment(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouterApp.searchProductFragment,
          page: () => SearchProductFragment(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouterApp.listProductScreen,
          page: () => ListProductScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouterApp.menuScreen,
          page: () => MenuScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
