import 'package:flutter/widgets.dart';
import 'package:nanoshop_app/helpers/helper_function.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/favourite_icon_widget/favourite_icon_widget.dart';
import 'package:nanoshop_app/widgets/icon_assets/tag_icon.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';

class ProductGridTile extends StatelessWidget {
  final dynamic model;

  const ProductGridTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                child: Image.asset(
                  model.url,
                  height: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            MarginBottom10(
              child: Text(
                model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle2.copyWith(
                  color: color5,
                ),
              ),
            ),
            MarginBottom10(
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
            MarginBottom10(
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
          child: TagIcon(percent: model.percentSale),
        ),
      ],
    );
  }
}
