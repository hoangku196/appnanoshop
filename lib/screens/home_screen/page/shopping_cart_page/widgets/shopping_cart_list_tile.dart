import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/widgets/margins/margin_right10.dart';

class ShoppingCartListTile extends StatelessWidget {
  final dynamic model;

  const ShoppingCartListTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                      Icon(
                        Icons.close,
                        size: 18,
                        color: color12,
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
                    Text(
                      model.price.toString(),
                      style: textStyle2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color1,
                      ),
                    ),
                    Text(
                      model.priceSale.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
