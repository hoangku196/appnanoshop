
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/utils/global_key/global_key_app.dart';

List dummyBottomNav = [
  DummyBottomNav(
    name: "Trang chủ",
    url: AssetsPath.bottomIconHome,
    idNav: GlobalKeyApp.idHomeAppNav,
  ),
  DummyBottomNav(
    name: "Tin tức",
    url: AssetsPath.bottomIconNews,
    idNav: GlobalKeyApp.idNewAppNav,
  ),
  DummyBottomNav(
    name: "Thông báo",
    url: AssetsPath.appBarIconNotification,
    idNav: GlobalKeyApp.idNotificationAppNav,
  ),
  DummyBottomNav(
    name: "Tài khoản",
    url: AssetsPath.bottomIconAccount,
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
