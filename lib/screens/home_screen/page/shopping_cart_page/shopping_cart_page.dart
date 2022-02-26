import 'package:flutter/material.dart';
import 'package:nanoshop_app/helpers/helper_function.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_product.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';

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
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _shoppingCartAnimatedList,
              initialItemCount: dummyProduct.length,
              itemBuilder: (
                BuildContext context,
                int index,
                Animation<double> animation,
              ) {
                return ShoppingCartListTile(
                  model: dummyProduct[index],
                  onRemoveItem: () {
                    _shoppingCartAnimatedList.currentState?.removeItem(
                      index,
                      (context, animation) => FadeTransition(
                        opacity: animation,
                        child: ShoppingCartListTile(
                          model: dummyProduct[index],
                        ),
                      ),
                      duration: const Duration(milliseconds: 300),
                    );
                    dummyProduct.remove(dummyProduct[index]);
                    setState(() {});
                  },
                );
              },
            ),
          ),
          TotalPriceCart(),
        ],
      ),
    );
  }
}

class TotalPriceCart extends StatelessWidget {
  const TotalPriceCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainMargin(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tiền tạm tính :',
                  style: textStyle2.copyWith(
                    color: color12,
                  ),
                ),
                Text(
                  HelperFunction.convertPrice(1000000),
                  style: textStyle2.copyWith(
                    color: color12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tiền tạm tính :',
                  style: textStyle2.copyWith(
                    color: color12,
                  ),
                ),
                Text(
                  HelperFunction.convertPrice(1000000),
                  style: textStyle2.copyWith(
                    color: color12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng cộng :',
                  style: textStyle1.copyWith(
                    color: color12,
                  ),
                ),
                Text(
                  HelperFunction.convertPrice(1000000),
                  style: textStyle1.copyWith(
                    color: color12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
