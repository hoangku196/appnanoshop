import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: "Thông báo",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotificationItem(
              url: AssetsPath.hotSaleIconNotificationScreen,
              sub: "Khuyến mãi",
              title: "Khuyến mãi",
              count: 50,
            ),
            NotificationItem(
              url: AssetsPath.updateIconNotificationScreen,
              sub: "Cập nhật TATRA Pharmacy",
              title: "Cập nhật",
              count: 50,
            ),
            NotificationItem(
              url: AssetsPath.voucherIconNotificationScreen,
              sub: "Voucher",
              title: "Voucher",
              count: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String sub;
  final String url;
  final int count;
  final GestureTapCallback? onTap;

  NotificationItem({
    required this.title,
    required this.url,
    required this.sub,
    this.onTap,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColor.color36, width: 1),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 55,
              width: 55,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(55),
                border: Border.all(color: AppColor.color36, width: 1),
              ),
              child: Image.asset(
                url,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color37,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    sub,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color8,
                    ),
                  ),
                ],
              ),
            ),
            count != null && count > 0
                ? SizedBox(
              width: 10,
            )
                : Container(),
            count != null && count > 0
                ? Container(
                height: 21,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: AppColor.color17,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      count > 99 ? "99" : "$count",
                      textAlign: TextAlign.center,
                      style: TextStyleApp.textStyle1,
                    ),
                    count != null && count > 99
                        ? Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 12,
                    )
                        : Container()
                  ],
                ))
                : Container(),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.navigate_next,
              color: AppColor.color13,
            ),
          ],
        ),
      ),
    );
  }
}

