import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/shared_components/widgets/favourite_icon_widget/favourite_icon_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/icon_assets/tag_icon.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/load_image_from_network.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/utils/helpers/helper_function.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../../../../config/router/router_app.dart';
import '../../../../detail_product_screen/arguments/detail_product_argument_screen.dart';

class ProductGridTile extends StatelessWidget {
  final dynamic model;

  const ProductGridTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(
          RouterApp.detailProductScreen,
          // id: GlobalKeyApp.idMainAppNav,
          arguments: DetailProductArgumentScreen(
            model: model,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarginBottom10(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    child: LoadImageFromNetwork(
                      url: model.avatarPath + model.avatarName,
                    ),
                  ),
                ),
                MarginBottom10(
                  child: Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color5,
                    ),
                  ),
                ),
                MarginBottom10(
                  child: Text(
                    Helper.convertPrice(double.parse(model.price).round()),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyleApp.textStyle3.copyWith(
                      fontSize: 16,
                      color: AppColor.color1,
                    ),
                  ),
                ),
                MarginBottom10(
                  child: Text(
                    Helper.convertPrice(double.parse(model.priceMarket).round()),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    style: TextStyleApp.textStyle2.copyWith(
                      color: AppColor.color10,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 5,
              left: 5,
              child: FavouriteIconWidget(
                iconSize: 25,
                valueChanged: (value) {},
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: TagIcon(percent: int.parse(model.discountPercent)),
            ),
          ],
        ),
      ),
    );
  }
}
