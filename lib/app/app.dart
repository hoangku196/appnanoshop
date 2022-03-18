import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/features/screens/detail_news_screen/arguments/detail_news_arguments_screen.dart';
import 'package:nanoshop_app/app/features/screens/detail_news_screen/detail_news_screen.dart';
import 'package:nanoshop_app/app/features/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/shopping_cart_page/shopping_cart_page.dart';
import 'package:nanoshop_app/app/features/screens/notification_screen/notification_screen.dart';
import 'package:nanoshop_app/app/features/screens/order_address_screen/order_address_screen.dart';
import 'package:nanoshop_app/app/features/screens/payment_method_screen/payment_method_screen.dart';
import 'package:nanoshop_app/app/features/screens/payment_screen/payment_screen.dart';
import 'package:nanoshop_app/app/features/screens/re_password_screen/re_password_screen.dart';
import 'package:nanoshop_app/app/features/screens/send_comment_screen/send_comment_screen.dart';
import 'package:nanoshop_app/app/features/screens/verification_screen/verification_screen.dart';
import 'package:provider/provider.dart';

import 'config/router/router_app.dart';
import 'features/providers/shopping_cart_provider.dart';
import 'features/screens/before_login_screen/before_login_screen.dart';
import 'features/screens/detail_product_screen/detail_product_screen.dart';
import 'features/screens/home_screen/home_screen.dart';
import 'features/screens/list_product_screen/list_product_screen.dart';
import 'features/screens/list_rating_screen/list_rating_screen.dart';
import 'features/screens/login_screen/login_screen.dart';
import 'features/screens/sign_up_screen/sign_up_screen.dart';
import 'features/screens/starter_screen/starter_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
      ],
      child: GetMaterialApp(
        initialRoute: RouterApp.starterScreen,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case RouterApp.starterScreen:
              return GetPageRoute(
                settings: settings,
                page: () => StarterScreen(),
                transition: Transition.fadeIn,
              );
            case RouterApp.beforeLoginScreen:
              return GetPageRoute(
                settings: settings,
                page: () => BeforeLoginScreen(),
                transition: Transition.zoom,
              );
            case RouterApp.loginScreen:
              return GetPageRoute(
                settings: settings,
                page: () => LoginScreen(),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.signInScreen:
              return GetPageRoute(
                settings: settings,
                page: () => SignUpScreen(),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.homeScreen:
              return GetPageRoute(
                settings: settings,
                page: () => HomeScreen(),
                transition: Transition.topLevel,
              );
            case RouterApp.listProductScreen:
              return GetPageRoute(
                settings: settings,
                page: () => ListProductScreen(
                  argument: settings.arguments,
                ),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.detailProductScreen:
              return GetPageRoute(
                settings: settings,
                page: () => DetailProductScreen(arguments: settings.arguments),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.listRatingScreen:
              return GetPageRoute(
                settings: settings,
                page: () => ListRatingScreen(
                  arguments: settings.arguments,
                ),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.detailNewsScreen:
              return GetPageRoute(
                settings: settings,
                page: () => DetailNewsScreen(
                  arguments: settings.arguments as DetailNewArgumentScreen,
                ),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.shoppingCartScreen:
              return GetPageRoute(
                settings: settings,
                page: () => ShoppingCartPage(),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.paymentScreen:
              return GetPageRoute(
                settings: settings,
                page: () => PaymentScreen(),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.orderAddressScreen:
              return GetPageRoute(
                settings: settings,
                page: () => OrderAddressScreen(),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.paymentMethodScreen:
              return GetPageRoute(
                settings: settings,
                page: () => PaymentMethodScreen(),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.sendCommentScreen:
              return GetPageRoute(
                settings: settings,
                page: () => SendCommentScreen(
                  arguments: settings.arguments,
                ),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.notificationScreen:
              return GetPageRoute(
                settings: settings,
                page: () => NotificationScreen(),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.forgotPasswordScreen:
              return GetPageRoute(
                settings: settings,
                page: () => ForgotPasswordScreen(),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.verificationScreen:
              return GetPageRoute(
                settings: settings,
                page: () => VerificationScreen(
                  argument: settings.arguments,
                ),
                transition: Transition.rightToLeftWithFade,
              );
            case RouterApp.rePasswordScreen:
              return GetPageRoute(
                settings: settings,
                page: () => RePasswordScreen(),
                transition: Transition.rightToLeftWithFade,
              );
          }
        },
        // getPages: [
        //   GetPage(
        //     name: RouterApp.starterScreen,
        //     page: () => StarterScreen(),
        //     transition: Transition.fadeIn,
        //   ),
        //   GetPage(
        //     name: RouterApp.beforeLoginScreen,
        //     page: () => BeforeLoginScreen(),
        //     transition: Transition.zoom,
        //   ),
        //   GetPage(
        //     name: RouterApp.loginScreen,
        //     page: () => LoginScreen(),
        //     transition: Transition.rightToLeftWithFade,
        //   ),
        //   GetPage(
        //     name: RouterApp.signInScreen,
        //     page: () => SignInScreen(),
        //     transition: Transition.rightToLeftWithFade,
        //   ),
        //   GetPage(
        //     name: RouterApp.homeScreen,
        //     page: () => HomeScreen(),
        //     transition: Transition.topLevel,
        //   ),
        //   // GetPage(
        //   //   name: RouterApp.searchProductFragment,
        //   //   page: () => SearchProductFragment(),
        //   //   transition: Transition.rightToLeftWithFade,
        //   // ),
        //   GetPage(
        //     name: RouterApp.listProductScreen,
        //     page: () => ListProductScreen(),
        //     transition: Transition.rightToLeftWithFade,
        //   ),
        //   // GetPage(
        //   //   name: RouterApp.menuScreen,
        //   //   page: () => MenuScreen(),
        //   //   transition: Transition.rightToLeftWithFade,
        //   // ),
        // ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
