import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/config/router/home_page_router.dart';
import 'package:nanoshop_app/app/shared_components/widgets/dash/dash.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_menu.dart';
import 'package:nanoshop_app/app/utils/global_key/global_key_app.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../shared_components/widgets/app_bar/page_app_bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  checkSize(Size size) {
    double a = size.width / 150;
    double b = a - a.floor();
    int count = 2;
    if (b > 0.75) {
      count = a.round();
    } else {
      count = a.floor();
    }
    return count;
  }

  Widget _itemMenu({
    dynamic model,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        model.onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 10,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 25,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              model.url,
              color: AppColor.color27,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              model.name,
              style: TextStyleApp.textStyle2.copyWith(
                color: AppColor.color11,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Dash(
              color: AppColor.color13,
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "33",
                    style: TextStyleApp.textStyle1.copyWith(
                      fontSize: 15,
                      color: AppColor.color17,
                    ),
                  ),
                  TextSpan(
                    text: " thông báo mới",
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.color30.withOpacity(0.2),
      appBar: const PageAppBar(
        title: "Menu",
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              onTap: () {
                Get.toNamed(HomePageRouter.search,
                    id: GlobalKeyApp.idHomeAppNav);
              },
              readOnly: true,
              decoration: InputDecoration(
                hintStyle: TextStyleApp.textStyle2.copyWith(
                  color: AppColor.color13,
                ),
                hintText: "Từ khóa tìm kiếm...",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                suffixIcon: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColor.color27,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 10,
                alignment: WrapAlignment.spaceBetween,
                spacing: 10,
                children: [
                  ...List.generate(
                    dummyMenu.length,
                    (index) => _itemMenu(
                      model: dummyMenu[index],
                      context: context,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: GridView(
          //     shrinkWrap: true,
          //     padding: EdgeInsets.all(15),
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: checkSize(size),
          //       crossAxisSpacing: 20,
          //       mainAxisSpacing: 20,
          //       mainAxisExtent: 180,
          //     ),
          //     children: dummyMenu
          //         .map(
          //           (e) => _itemMenu(
          //             model: e,
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
