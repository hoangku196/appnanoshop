import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/features/providers/shopping_cart_provider.dart';
import 'package:nanoshop_app/app/shared_components/widgets/border_bottom/border_bottom_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/load_image_from_network.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/row_item_attribute/row_item_attribute.dart';
import 'package:nanoshop_app/app/utils/helpers/helper_function.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:provider/provider.dart';

class BottomSheetProduct extends StatefulWidget {
  final dynamic model;

  const BottomSheetProduct({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _BottomSheetProductState createState() => _BottomSheetProductState();
}

class _BottomSheetProductState extends State<BottomSheetProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      color: Colors.white,
      child: Wrap(
        children: [
          MarginBottom10(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.back(
                      result: false,
                    );
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColor.color13,
                  ),
                ),
              ],
            ),
          ),
          BorderBottomWidget(
            widthBorder: 1,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarginRight10(
                    child: Container(
                      height: 128,
                      width: 128,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.color14,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: LoadImageFromNetwork(
                          url:
                              widget.model.avatarPath + widget.model.avatarName,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleApp.textStyle3.copyWith(
                            color: AppColor.color11,
                          ),
                        ),
                        Text(
                          Helper.convertPrice(
                              double.parse(widget.model.price).round()),
                          style: TextStyleApp.textStyle3.copyWith(
                            color: AppColor.color25,
                          ),
                        ),
                        Text(
                          Helper.convertPrice(
                              double.parse(widget.model.priceMarket).round()),
                          style: TextStyleApp.textStyle4.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppColor.color13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BorderBottomWidget(
            widthBorder: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarginBottom10(
                    child: Text(
                      'Dung tích',
                      style: TextStyleApp.textStyle2.copyWith(
                        color: AppColor.color11,
                      ),
                    ),
                  ),
                  RowItemAttribute(),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AmountProduct(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColor.color21,
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<ShoppingCartProvider>(
                      builder: (context, _model, child) => InkWell(
                        onTap: () {
                          _model.addCart(newItem: widget.model);

                          Get.back(
                            result: false,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                            color: AppColor.color32.withOpacity(0.3),
                          ),
                          child: Center(
                            child: Text(
                              'Thêm vào giỏ hàng',
                              style: TextStyleApp.textStyle2.copyWith(
                                color: AppColor.color27,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back(
                          result: true,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColor.color20,
                              AppColor.color21,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Mua ngay',
                            style: TextStyleApp.textStyle5.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
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

class AmountProduct extends StatefulWidget {
  const AmountProduct({Key? key}) : super(key: key);

  @override
  _AmountProductState createState() => _AmountProductState();
}

class _AmountProductState extends State<AmountProduct> {
  var _amount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Số lượng',
          style: TextStyleApp.textStyle2.copyWith(
            color: AppColor.color11,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: AppColor.color30.withOpacity(0.3),
            border: Border.all(
              color: AppColor.color31,
            ),
            borderRadius: BorderRadius.circular(1),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (_amount >= 2) _amount--;
                  setState(() {});
                },
                child: Icon(
                  Icons.remove,
                  size: 14,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColor.color21.withOpacity(0.5),
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: AppColor.color31,
                    ),
                    left: BorderSide(
                      width: 1,
                      color: AppColor.color31,
                    ),
                  ),
                ),
                child: Text(
                  _amount.toString(),
                  style: TextStyleApp.textStyle1.copyWith(
                    color: AppColor.color27,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _amount++;
                  setState(() {});
                },
                child: Icon(
                  Icons.add,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
