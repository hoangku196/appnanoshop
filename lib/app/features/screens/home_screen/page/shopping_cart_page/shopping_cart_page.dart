import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/features/providers/shopping_cart_provider.dart';
import 'package:nanoshop_app/app/shared_components/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/app/shared_components/widgets/bottom_nav/bottom_nav_text.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_product.dart';
import 'package:nanoshop_app/app/utils/helpers/helper_function.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:provider/provider.dart';
import 'widgets/shopping_cart_list_tile.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage>
    with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _shoppingCartAnimatedList =
      GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: "Giỏ hàng",
      ),
      body: Consumer<ShoppingCartProvider>(
        builder: (context, _model, child) {
          if (_model.countItem > 0) {
            return Column(
              children: [
                Expanded(
                  child: AnimatedList(
                    key: _shoppingCartAnimatedList,
                    initialItemCount: _model.listShopping.length,
                    shrinkWrap: true,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                      Animation<double> animation,
                    ) {
                      return ShoppingCartListTile(
                        model: _model.listShopping[index],
                        onRemoveItem: () {
                          _shoppingCartAnimatedList.currentState?.removeItem(
                            index,
                            (context, animation) => FadeTransition(
                              opacity: animation,
                              child: ShoppingCartListTile(
                                model: _model.listShopping[index],
                              ),
                            ),
                            duration: const Duration(milliseconds: 300),
                          );
                          // dummyProduct.remove(dummyProduct[index]);
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
                TotalPriceCart(),
              ],
            );
          } else {
            return Center(
              child: Text(
                'Hiện chưa có sản phẩm nào trong giỏ hàng',
                style: TextStyleApp.textStyle3,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavText(
        title: 'Đồng ý',
        onTap: () {
          Get.toNamed(
            RouterApp.paymentScreen,
          );
        },
      ),
    );
  }
}

class TotalPriceCart extends StatelessWidget {
  const TotalPriceCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartProvider>(
      builder: (context, _model, child) => MainMargin(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng cộng :',
                style: TextStyleApp.textStyle1.copyWith(
                  color: AppColor.color27,
                ),
              ),
              Text(
                Helper.convertPrice(_model.totalPrice),
                style: TextStyleApp.textStyle1.copyWith(
                  color: AppColor.color27,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
