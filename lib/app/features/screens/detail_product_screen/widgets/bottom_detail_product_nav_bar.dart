import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/widgets/bottom_sheet/bottom_sheet_product.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class BottomDetailProductNavBar extends StatelessWidget {
  final dynamic model;

  const BottomDetailProductNavBar({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.color18,
            AppColor.color19,
          ],
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AssetsPath.chatNowDetailProductIcon,
                                width: 15,
                                height: 15,
                              ),
                              Text(
                                'Chat ngay',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleApp.textStyle2.copyWith(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 10,
                      ),
                      child: VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            BottomSheetProduct(
                              model: model,
                            ),
                            isScrollControlled: true,
                            useRootNavigator: true,
                          ).then((value) {
                            if (value != null) {
                              if (!value) {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    message: "Thêm vào giỏ hàng thành công",
                                  ),
                                );
                              } else {
                                Get.toNamed(RouterApp.shoppingCartScreen);
                              }
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AssetsPath.shoppingCartDetailProductIcon,
                              ),
                              Text(
                                'Thêm vào giỏ hàng',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleApp.textStyle2.copyWith(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.toNamed(RouterApp.shoppingCartScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColor.color20, AppColor.color21],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Mua ngay",
                      textAlign: TextAlign.center,
                      style: TextStyleApp.textStyle7.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
