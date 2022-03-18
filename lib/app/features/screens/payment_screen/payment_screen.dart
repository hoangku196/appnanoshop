import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/shopping_cart_page/widgets/shopping_cart_list_tile.dart';
import 'package:nanoshop_app/app/shared_components/widgets/border_bottom/border_bottom_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/remove_focus_widget/remove_focus_widget.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:provider/provider.dart';

import '../../../config/router/router_app.dart';
import '../../../shared_components/widgets/app_bar/page_app_bar.dart';
import '../../../shared_components/widgets/bottom_nav/bottom_nav_text.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../utils/models/product_response.dart';
import '../../../utils/style/app_color.dart';
import '../../providers/shopping_cart_provider.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController text = new TextEditingController();
  TextEditingController _voucherController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PageAppBar(
          title: "Thanh toán",
        ),
        body: Body(),
        bottomNavigationBar: BottomNavText(
          title: 'Thanh toán',
          onTap: () {
            Get.toNamed(
              RouterApp.paymentScreen,
            );
          },
        ),
      ),
    );
  }

  Widget Body() {
    return Consumer<ShoppingCartProvider>(
      builder: (context, _model, child) {
        if (_model.countItem > 0) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: listItemOrder(
                    listShopping: _model.listShopping,
                  ),
                ),
                BorderBottomWidget(
                  child: magiamgia(),
                ),
                // donvivanchuyen(),
                // Container(
                //   width: double.infinity,
                //   height: 5,
                //   color: AppColor.color1,
                // ),
                BorderBottomWidget(
                  child: diachi(
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(
                      //     builder: (context) => OrderAddressScreen()))
                      //     .then(
                      //       (value) {
                      //     if (value != null) {
                      //       _model.setOrderAddressModel(orderAddress: value);
                      //     }
                      //   },
                      // );
                    },
                  ),
                ),
                BorderBottomWidget(
                  child: thanhtoan(),
                ),
                priceOrder(),
              ],
            ),
          );
        } else {
          return Center(
            child: Text(
              'Hiện chưa có sản phẩm nào',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.nunito(
                color: AppColor.color1,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
      },
    );
  }

  Widget listItemOrder({
    required List<ProductResponse> listShopping,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        listShopping.length,
        (index) => ShoppingCartListTile(
          model: listShopping[index],
        ),
      ),
    );
  }

  Widget magiamgia() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AssetsPath.voucherIconPaymentScreen,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Mã giảm giá :",
                overflow: TextOverflow.ellipsis,
                style: TextStyleApp.textStyle5.copyWith(
                  fontSize: 14,
                  color: AppColor.color12,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColor.color27.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      "Chọn hoặc nhập mã",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleApp.textStyle2.copyWith(
                        color: AppColor.color27,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Consumer<ShoppingCartProvider>(
                  builder: (context, _model, child) => Container(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () async {
                            _model.setVoucher(
                                voucher: _voucherController.text,
                                context: context);
                          },
                          child: Container(
                            width: 99,
                            decoration: BoxDecoration(
                              color: AppColor.color27,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(5),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Áp dụng",
                                style: TextStyleApp.textStyle2.copyWith(
                                  color: AppColor.color21,
                                ),
                              ),
                            ),
                          ),
                        ),
                        hintText: "Nhập mã khuyến mại",
                        hintStyle: TextStyleApp.textStyle2.copyWith(
                          color: AppColor.color10,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.color16, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.color21, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.color1, width: 1)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.color1, width: 1)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget donvivanchuyen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AssetsPath.locationIconPaymentScreen,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Đơn vị vận chuyển:",
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 10,
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      "Nhấn để chọn",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Giao hàng tiết kiệm",
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "23.000đ",
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget diachi({required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AssetsPath.locationIconPaymentScreen,
                color: AppColor.color27,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Địa chỉ nhận hàng:",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyleApp.textStyle5.copyWith(
                  fontSize: 14,
                  color: AppColor.color12,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Spacer(),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(RouterApp.orderAddressScreen);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColor.color27.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "Chỉnh sửa",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleApp.textStyle2.copyWith(
                          color: AppColor.color27,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Consumer<ShoppingCartProvider>(
            builder: (context, _model, child) {
              if (_model.orderAddress != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          _model.orderAddress!.name ?? "",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              _model.orderAddress!.phone ?? "",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      _model.orderAddress!.address ?? "",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                );
              }

              return Text(
                'Chưa chọn địa chỉ nhận hàng',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyleApp.textStyle2.copyWith(
                  color: AppColor.color12,
                ),
              );
            },
          ),
          // Row(
          //   children: [
          //     Text(
          //       "Nguyễn Văn A",
          //       textAlign: TextAlign.center,
          //       style: GoogleFonts.nunito(
          //         color: colorGrey5,
          //         fontSize: 14,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Spacer(),
          //     Expanded(
          //       flex: 1,
          //       child: Container(
          //         padding: const EdgeInsets.symmetric(vertical: 5),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(6),
          //           color: colorBlue6,
          //         ),
          //         child: Center(
          //           child: Text(
          //             "(+84) 123 456 789",
          //             textAlign: TextAlign.center,
          //             style: GoogleFonts.nunito(
          //               color: Colors.white,
          //               fontSize: 14,
          //               fontWeight: FontWeight.w400,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          // Text(
          //   "Xuân Thủy - Cầu Giấy - HN",
          //   textAlign: TextAlign.left,
          //   overflow: TextOverflow.ellipsis,
          //   maxLines: 2,
          //   style: GoogleFonts.nunito(
          //     color: colorGrey5,
          //     fontSize: 14,
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget thanhtoan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AssetsPath.walletIconPaymentScreen,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Phương thức thanh toán:",
                textAlign: TextAlign.center,
                style: TextStyleApp.textStyle5.copyWith(
                  fontSize: 14,
                  color: AppColor.color12,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Consumer<ShoppingCartProvider>(
                  builder: (context, _model, child) => InkWell(
                    onTap: () {
                      Get.toNamed(RouterApp.paymentMethodScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColor.color27.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Lựa chọn",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleApp.textStyle2.copyWith(
                            color: AppColor.color27,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Consumer<ShoppingCartProvider>(
            builder: (context, _model, child) {
              if (_model.methodPayment != null) {
                return Text(
                  _model.methodPayment!.name,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleApp.textStyle2.copyWith(
                    color: AppColor.color12,
                  ),
                );
              }

              return Text(
                'Chưa chọn phương thức thanh toán',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyleApp.textStyle2.copyWith(
                  color: AppColor.color12,
                ),
              );
            },
          ),
          // Text(
          //   "Thẻ tín dụng/ghi nợ",
          //   textAlign: TextAlign.left,
          //   overflow: TextOverflow.ellipsis,
          //   style: StyleTextApp.textStyle(
          //     color: colorGrey2,
          //     fontSize: 14,
          //     fontWeight: FontWeight.w700,
          //   ),
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Số tài khoản:",
          //       textAlign: TextAlign.left,
          //       overflow: TextOverflow.ellipsis,
          //       style: StyleTextApp.textStyle(
          //         color: colorGrey2,
          //         fontSize: 14,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 15,
          //     ),
          //     Expanded(
          //       child: Text(
          //         "0123456789 - Ngân hàng Vietcombank chi nhánh Cầu Giấy",
          //         textAlign: TextAlign.left,
          //         overflow: TextOverflow.ellipsis,
          //         maxLines: 2,
          //         style: StyleTextApp.textStyle(
          //           color: colorGrey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Chủ tài khoản:",
          //       textAlign: TextAlign.left,
          //       overflow: TextOverflow.ellipsis,
          //       style: StyleTextApp.textStyle(
          //         color: colorGrey2,
          //         fontSize: 14,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 15,
          //     ),
          //     Expanded(
          //       child: Text(
          //         "Nguyễn Văn A",
          //         textAlign: TextAlign.left,
          //         overflow: TextOverflow.ellipsis,
          //         maxLines: 2,
          //         style: StyleTextApp.textStyle(
          //           color: colorGrey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget priceOrder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Consumer<ShoppingCartProvider>(
        builder: (context, _model, child) => Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng cộng :',
                style: TextStyleApp.textStyle1.copyWith(
                  color: AppColor.color12,
                ),
              ),
              Text(
                Helper.convertPrice(_model.totalPrice),
                style: TextStyleApp.textStyle1.copyWith(
                  color: AppColor.color27,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
