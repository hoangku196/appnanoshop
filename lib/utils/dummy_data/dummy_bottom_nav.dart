import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/global_key/global_key_app.dart';

List dummyBottomNav = [
  DummyBottomNav(
    name: "Trang chủ",
    url: AssetsSource.bottomIconHome,
    idNav: GlobalKeyApp.idHomeAppNav,
  ),
  DummyBottomNav(
    name: "Tin tức",
    url: AssetsSource.bottomIconNews,
    idNav: GlobalKeyApp.idNewAppNav,
  ),
  DummyBottomNav(
    name: "Thông báo",
    url: AssetsSource.appBarIconNotification,
    idNav: GlobalKeyApp.idNotificationAppNav,
  ),
  DummyBottomNav(
    name: "Tài khoản",
    url: AssetsSource.bottomIconAccount,
    idNav: GlobalKeyApp.idAccountAppNav,
  ),
];

class DummyBottomNav {
  final String name;
  final String url;
  final dynamic idNav;

 const DummyBottomNav({
    required this.name,
    required this.url,
    required this.idNav,
  });
}
