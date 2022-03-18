import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/widgets/border_container/border_container.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/load_image_from_network.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/helpers/helper_function.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class ShoppingCartListTile extends StatelessWidget {
  final dynamic model;
  final Function()? onRemoveItem;

  const ShoppingCartListTile({
    Key? key,
    required this.model,
    this.onRemoveItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarginRight10(
            child: Column(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  child: LoadImageFromNetwork(
                    url: model.avatarPath + model.avatarName,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MarginBottom10(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarginBottom10(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            model.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyleApp.textStyle6,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        InkWell(
                          onTap: onRemoveItem,
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: AppColor.color12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MarginBottom10(
                    child: Text(
                      'Dung tích: 50g',
                      style: TextStyleApp.textStyle4.copyWith(
                        color: AppColor.color13,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MarginRight10(
                        child: Text(
                          Helper.convertPrice(double.parse(model.price).round()),
                          style: TextStyleApp.textStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.color27,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          Helper.convertPrice(double.parse(model.priceMarket).round()),
                          style: TextStyleApp.textStyle4.copyWith(
                            // fontWeight: FontWeight.bold,
                            color: AppColor.color10,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColor.color10,
                            width: 1,
                          ),
                        ),
                        child: Image.asset(
                          AssetsPath.minimizedIcon,
                          width: 6,
                          height: 6,
                        ),
                      ),
                      MainMargin(
                        child: Text(
                          model.total.toString(),
                          style: TextStyleApp.textStyle1.copyWith(
                            color: AppColor.color10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.color27,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          AssetsPath.addIcon,
                          width: 6,
                          height: 6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
