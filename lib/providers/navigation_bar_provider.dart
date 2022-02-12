import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';

class NavigationBarProvider extends ChangeNotifier {
  var _currentTab = 0;

  int get currentTab => _currentTab;

  final List<BottomNavigationBarItem> _listBottomNavigationBarItem = [
    BottomNavigationBarItem(
      title: "Trang chủ",
      assetsSource: AssetsSource.bottomIconHome,
      index: 0,
    ),
    BottomNavigationBarItem(
      title: "Tin tức",
      assetsSource: AssetsSource.bottomIconNews,
      index: 1,
    ),
    BottomNavigationBarItem(
      title: "Giỏ hàng",
      assetsSource: AssetsSource.bottomIconShoppingCart,
      index: 2,
      hasProvider: true,
    ),
    BottomNavigationBarItem(
      title: "Chat",
      assetsSource:  AssetsSource.bottomIconMessage,
      index: 3,
    ),
    BottomNavigationBarItem(
      title: "Tài khoản",
      assetsSource:  AssetsSource.bottomIconAccount,
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
