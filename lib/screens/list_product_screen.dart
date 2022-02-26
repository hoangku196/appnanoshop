import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_product.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/widgets/slider_image/main_slider_image.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'home_screen/page/home_page/widgets/product_grid_tile.dart';

class ListProductScreen extends StatelessWidget {
  final String title;

  const ListProductScreen({
    Key? key,
    this.title = "Không xác định",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textStyle1.copyWith(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: color5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: MainSliderImage(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            MainMargin(
              child: MarginBottom10(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '(Có 30 sản phẩm phù hợp)',
                      style: textStyle4.copyWith(
                        color: color12,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(AssetsSource.shortIcon),
                        SizedBox(
                          width: 16,
                        ),
                        Image.asset(AssetsSource.filterIcon),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            MainMargin(
              child: StaggeredGridView.count(
                staggeredTiles: dummyProduct
                    .map<StaggeredTile>((_) => StaggeredTile.fit(1))
                    .toList(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                children: dummyProduct
                    .map(
                      (e) => ProductGridTile(model: e),
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
