import 'package:flutter/material.dart';
import 'package:nanoshop_app/helpers/helper_function.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/favourite_icon_widget/favourite_icon_widget.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';

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
                      child: Image.asset(
                        model.url,
                        fit: BoxFit.cover,
                        height: 252,
                      ),
                    ),
                  ),
                  MarginBottom10(
                    child: MainMargin(
                      child: Container(
                        child: Text(
                          model.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle2.copyWith(
                            color: color5,
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
                            HelperFunction.convertPrice(model.price),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: textStyle3.copyWith(
                              fontSize: 16,
                              color: color1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            HelperFunction.convertPrice(model.priceSale),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            style: textStyle2.copyWith(
                              color: color10,
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
