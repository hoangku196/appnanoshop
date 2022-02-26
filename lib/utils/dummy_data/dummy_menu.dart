import 'package:nanoshop_app/utils/assets_source/assets_source.dart';

var dummyMenu = [
  DummyMenu(
    name: "Thông báo",
    url: AssetsSource.notificationMenuIcon,
  ),
  DummyMenu(
    name: "Đơn hàng",
    url: AssetsSource.fileMenuIcon,
  ),
  DummyMenu(
    name: "Giỏ hàng",
    url: AssetsSource.cartMenuIcon,
  ),
  DummyMenu(
    name: "Lịch sử thanh toán",
    url: AssetsSource.walletMenuIcon,
  ),
  DummyMenu(
    name: "Liên hệ",
    url: AssetsSource.phoneMenuIcon,
  ),
  DummyMenu(
    name: "Hỏi & đáp",
    url: AssetsSource.attentionMenuIcon,
  ),
];

class DummyMenu {
  final String name;
  final String url;

  DummyMenu({
    required this.name,
    required this.url,
  });
}
