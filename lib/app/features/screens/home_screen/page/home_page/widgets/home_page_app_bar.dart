import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanoshop_app/app/config/router/home_page_router.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/features/providers/shopping_cart_provider.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/utils/global_key/global_key_app.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:provider/provider.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Image.asset(
            AssetsPath.backgroundAppBar,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          // height: preferredSize.height,
          child: SafeArea(
            child: MainMargin(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(HomePageRouter.menu,
                            id: GlobalKeyApp.idHomeAppNav);
                      },
                      child: Image.asset(AssetsPath.appBarIconMenu),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            HomePageRouter.search,
                            id: GlobalKeyApp.idHomeAppNav,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Từ khóa tìm kiếm...',
                                    style: TextStyleApp.textStyle2.copyWith(
                                      color: AppColor.color8,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColor.color34,
                                    shape: BoxShape.circle,
                                  ),
                                  child:
                                      Image.asset(AssetsPath.appBarIconSearch),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Consumer<ShoppingCartProvider>(
                      builder: (context, _model, child) => InkWell(
                        onTap: (){
                          Get.toNamed(RouterApp.shoppingCartScreen);
                        },
                        child: Badge(
                          badgeContent: Text(
                            _model.countItem.toString(),
                            style: TextStyleApp.textStyle7.copyWith(
                              color: AppColor.color35,
                              fontSize: 14,
                            ),
                          ),
                          badgeColor: Colors.white,
                          animationDuration: Duration.zero,
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            AssetsPath.appBarShoppingBagIcon,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Image.asset(AssetsPath.appBarMessageIcon),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110);
}
