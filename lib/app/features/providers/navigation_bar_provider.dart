import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';

class NavigationBarProvider extends ChangeNotifier {
  var _currentTab = 0;

  int get currentTab => _currentTab;

  final List<BottomNavigationBarItem> _listBottomNavigationBarItem = [
    BottomNavigationBarItem(
      title: "Trang chủ",
      assetsSource: AssetsPath.bottomIconHome,
      index: 0,
    ),
    BottomNavigationBarItem(
      title: "Tin tức",
      assetsSource: AssetsPath.bottomIconNews,
      index: 1,
    ),
    BottomNavigationBarItem(
      title: "Giỏ hàng",
      assetsSource: AssetsPath.bottomIconShoppingCart,
      index: 2,
      hasProvider: true,
    ),
    BottomNavigationBarItem(
      title: "Chat",
      assetsSource:  AssetsPath.bottomIconMessage,
      index: 3,
    ),
    BottomNavigationBarItem(
      title: "Tài khoản",
      assetsSource:  AssetsPath.bottomIconAccount,
      index: 4,
    ),
  ];

  List<BottomNavigationBarItem> get listBottomNavigationBarItem =>
      _listBottomNavigationBarItem;

  setCurrentTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}

class BottomNavigationBarItem {
  String title;
  String assetsSource;
  int index;
  bool hasProvider;

  BottomNavigationBarItem({
    required this.title,
    required this.assetsSource,
    required this.index,
    this.hasProvider = false,
  });
}
