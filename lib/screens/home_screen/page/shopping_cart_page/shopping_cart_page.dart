import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_product.dart';
import 'package:nanoshop_app/widgets/app_bar/page_app_bar.dart';

import 'widgets/shopping_cart_list_tile.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

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
              initialItemCount: dummyProduct.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return ShoppingCartListTile(
                  model: dummyProduct[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
