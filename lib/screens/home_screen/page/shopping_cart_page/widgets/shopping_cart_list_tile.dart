import 'package:flutter/material.dart';
import 'package:nanoshop_app/helpers/helper_function.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/border_container/border_container.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/widgets/margins/margin_right10.dart';

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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(
                        model.url,
                      ),
                      fit: BoxFit.cover,
                    ),
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
                            model.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: textStyle6,
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
                            color: color12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MarginBottom10(
                    child: Text(
                      'Dung tích: 50g',
                      style: textStyle4.copyWith(
                        color: color13,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MarginRight10(
                        child: Text(
                          HelperFunction.convertPrice(model.price),
                          style: textStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: color1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          HelperFunction.convertPrice(model.priceSale),
                          style: textStyle4.copyWith(
                            // fontWeight: FontWeight.bold,
                            color: color10,
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
                            color: color10,
                            width: 1,
                          ),
                        ),
                        child: Image.asset(
                          AssetsSource.minimizedIcon,
                          width: 6,
                          height: 6,
                        ),
                      ),
                      MainMargin(
                        child: Text(
                          '1',
                          style: textStyle1.copyWith(
                            color: color10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: color1,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          AssetsSource.addIcon,
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
