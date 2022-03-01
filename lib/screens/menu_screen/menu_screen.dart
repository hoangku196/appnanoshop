import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_menu.dart';
import 'package:nanoshop_app/utils/global_key/global_key_app.dart';
import 'package:nanoshop_app/utils/router/home_page_router.dart';
import 'package:nanoshop_app/utils/router/router_app.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/dash/dash.dart';

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
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(model.url),
          SizedBox(
            height: 20,
          ),
          Text(
            model.name,
            style: textStyle6.copyWith(
              color: color11,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Dash(
            color: color1,
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "33",
                  style: textStyle1.copyWith(
                    fontSize: 15,
                    color: color17,
                  ),
                ),
                TextSpan(
                  text: " thông báo mới",
                  style: textStyle2.copyWith(
                    color: color17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color16,
      appBar: AppBar(
        title: Text(
          "Menu",
          style: textStyle1.copyWith(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: color5,
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
                Get.toNamed(HomePageRouter.search, id: GlobalKeyApp.idHomeAppNav);
              },
              readOnly: true,
              decoration: InputDecoration(
                hintStyle: textStyle2.copyWith(
                  color: color13,
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
                    color: color1,
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
            child: GridView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: checkSize(size),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 180,
              ),
              children: dummyMenu
                  .map(
                    (e) => _itemMenu(
                      model: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
