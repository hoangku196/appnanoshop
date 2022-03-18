import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class ProductListTile extends StatelessWidget {
  final dynamic model;

  const ProductListTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MainMargin(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width / 2,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MarginBottom10(
                child: Image.asset(
                  model.url,
                  height: size.width / 2,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MarginBottom10(
                      child: Text(
                        model.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleApp.textStyle2.copyWith(
                          fontSize: 13,
                          color: AppColor.color24,
                        ),
                      ),
                    ),
                    MarginBottom10(
                      child: Text(
                        model.price.toString(),
                        style: TextStyleApp.textStyle3.copyWith(
                          color: AppColor.color25,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    MarginBottom10(
                      child: Text(
                        model.priceSale.toString(),
                        style: TextStyleApp.textStyle4.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColor.color13,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        MarginRight10(
                          child: Icon(
                            Icons.star,
                            size: 12,
                            color: AppColor.color26,
                          ),
                        ),
                        Text(
                          '4/5',
                          style: TextStyleApp.textStyle4.copyWith(
                            color: AppColor.color13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
