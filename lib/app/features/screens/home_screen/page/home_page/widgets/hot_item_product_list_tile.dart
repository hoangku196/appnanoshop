import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/favourite_icon_widget/favourite_icon_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/load_image_from_network.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/utils/helpers/helper_function.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class HotItemProductListTile extends StatelessWidget {
  final dynamic model;
  final Function()? onTap;

  const HotItemProductListTile({
    Key? key,
    this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Container(
          width: 252,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarginBottom10(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LoadImageFromNetwork(
                        kHeightErrorIcon: 30,
                        url: model.avatarPath + model.avatarName,
                      ),
                    ),
                  ),
                  MarginBottom10(
                    child: MainMargin(
                      child: Container(
                        child: Text(
                          model.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleApp.textStyle2.copyWith(
                            color: AppColor.color5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  MainMargin(
                    child: Row(
                      children: [
                        Expanded(
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
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
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
                  ),
                ],
              ),
              Positioned(
                top: 5,
                left: 5,
                child: FavouriteIconWidget(
                  iconSize: 40,
                  valueChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
