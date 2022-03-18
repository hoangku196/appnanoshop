// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nanoshop_app/screens/home_screen/page/home_page/fragment/home_fragment.dart';
// import 'package:nanoshop_app/utils/enums/home_tab_item.dart';
//
// import 'home_page_tab_routes.dart';
//
// class HomePageTabNavigator extends StatelessWidget {
//   final GlobalKey<NavigatorState> navigatorKey;
//   final String initialRoute;
//
//   const HomePageTabNavigator({
//     Key? key,
//     required this.navigatorKey,
//     required this.initialRoute,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       initialRoute: initialRoute,
//       onGenerateRoute: (settings) {
//         Widget page;
//         switch (settings.name) {
//           case HomePageTabRoutes.homeFragment:
//             page = HomeFragment();
//             break;
//           case HomePageTabRoutes.categoryFragment:
//             page = CategoryFragment();
//             break;
//           default:
//             page = HomeFragment();
//         }
//         return PageRouteBuilder(
//           pageBuilder: (_, __, ___) => page,
//           transitionDuration: Duration(milliseconds: 1000),
//         );
//       },
//     );
//   }
// }
