import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/shared_components/widgets/border_bottom/border_bottom_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/repository/checkout_repository/checkout_repository.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import 'dart:async';

import '../../../config/router/router_app.dart';
import '../../../shared_components/widgets/app_bar/page_app_bar.dart';
import '../../../shared_components/widgets/bottom_nav/bottom_nav_text.dart';
import '../../../utils/models/province_select_model.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  // BlocPayment bloc = new BlocPayment();
  // ProvinceSelectModel? model;

  @override
  void initState() {
    super.initState();
  }

  AsyncMemoizer<List<ProvinceSelectModel>> memCache = AsyncMemoizer();

  Future<List<ProvinceSelectModel>> _getMethod() async {
    return memCache.runOnce(
      () => CheckoutRepository().getMethod(),
    );
  }

  ProvinceSelectModel? _selectedProvince;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: const PageAppBar(
          title: "Phương thức thanh toán",
        ),
        body: FutureBuilder(
          future: _getMethod(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ProvinceSelectModel>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  ...List.generate(
                    snapshot.data!.length,
                    (index) {
                      return ItemMethod(
                        isSelected: _selectedProvince == null
                            ? false
                            : _selectedProvince == snapshot.data![index]
                                ? true
                                : false,
                        model: snapshot.data![index],
                        onTap: () {
                          _selectedProvince = snapshot.data![index];
                          setState(() {});
                        },
                      );
                    },
                  ),
                ],
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.color21,
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("Chưa có phương thức thanh toán nào"),
              );
            }

            return Container();
          },
        ),
        bottomNavigationBar: BottomNavText(
          title: 'Đồng ý',
          onTap: () {
            Get.back();
          },
        ),
      ),
    );
  }
}

class ItemMethod extends StatelessWidget {
  final bool isSelected;
  final ProvinceSelectModel model;
  final Function()? onTap;

  const ItemMethod({
    Key? key,
    required this.isSelected,
    required this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderBottomWidget(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            children: [
              MarginRight10(
                child: Container(
                  width: 15,
                  height: 15,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? AppColor.color27 : AppColor.color10,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColor.color27 : null,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  model.name,
                  style: TextStyleApp.textStyle7.copyWith(
                    color: AppColor.color11,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
