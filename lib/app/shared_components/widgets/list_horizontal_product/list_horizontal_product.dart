import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/list_horizontal_product/product_list_tile.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_product.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class ListHorizontalProduct extends StatelessWidget {
  final String title;

  const ListHorizontalProduct({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColor.color30,
      child: MarginBottom10(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                title.toUpperCase(),
                style: TextStyleApp.textStyle7.copyWith(
                  color: AppColor.color11,
                  fontSize: 16,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: dummyProduct
                    .map(
                      (e) => ProductListTile(model: e),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
