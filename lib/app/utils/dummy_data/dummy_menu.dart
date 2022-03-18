import 'package:get/get.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';

var dummyMenu = [
  DummyMenu(
    name: "Thông báo",
    url: AssetsPath.notificationMenuIcon,
    onTap: () {
      Get.toNamed(RouterApp.notificationScreen);
    },
  ),
  DummyMenu(
    name: "Đơn hàng",
    url: AssetsPath.fileMenuIcon,
    onTap: () {},
  ),
  DummyMenu(
    name: "Giỏ hàng",
    url: AssetsPath.cartMenuIcon,
    onTap: () {
      Get.toNamed(RouterApp.shoppingCartScreen);
    },
  ),
  DummyMenu(
    name: "Lịch sử thanh toán",
    url: AssetsPath.walletMenuIcon,
    onTap: () {},
  ),
  DummyMenu(
    name: "Liên hệ",
    url: AssetsPath.phoneMenuIcon,
    onTap: () {},
  ),
  DummyMenu(
    name: "Hỏi & đáp",
    url: AssetsPath.attentionMenuIcon,
    onTap: () {},
  ),
];

class DummyMenu {
  final String name;
  final String url;
  final Function() onTap;

  DummyMenu({
    required this.name,
    required this.url,
    required this.onTap,
  });
}
