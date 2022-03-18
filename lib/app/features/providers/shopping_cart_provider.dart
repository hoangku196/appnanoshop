import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/constants/shared_prefs_path/shared_prefs_path.dart';
import 'package:nanoshop_app/app/utils/models/product_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/models/order_address_model.dart';
import '../../utils/models/province_select_model.dart';
import '../../utils/shared_prefs/shared_prefs.dart';

class ShoppingCartProvider extends ChangeNotifier {
  List<ProductResponse> _listShopping = [];
  OrderAddressModel? _orderAddress;
  ProvinceSelectModel? _methodPayment;
  String? _voucher;

  List<ProductResponse> get listShopping => _listShopping;

  OrderAddressModel? get orderAddress => _orderAddress;

  ProvinceSelectModel? get methodPayment => _methodPayment;

  int get countItem => _listShopping.length;

  int get totalPrice {
    var total = 0;

    if (_listShopping.isNotEmpty)
      _listShopping.forEach(
        (element) {
          total += int.parse(element.price!.split('.')[0].toString()) *
              element.total;
        },
      );

    return total;
  }

  setVoucher({required String voucher, required BuildContext context}) async {
    if (voucher.length > 0) {
      _voucher = voucher;
    }
  }

  setOrderAddressModel({required OrderAddressModel orderAddress}) {
    try {
      _orderAddress = orderAddress;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  setMethodPayment({required ProvinceSelectModel methodPayment}) {
    try {
      _methodPayment = methodPayment;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  addQty({
    required ProductResponse newItem,
  }) {}

  addCart({
    required ProductResponse newItem,
  }) async {
    if (!_listShopping.any((element) => element.id == newItem.id)) {
      newItem.total = 1;
      _listShopping.add(newItem);
    } else {
      ++_listShopping[
              _listShopping.indexWhere((element) => element.id == newItem.id)]
          .total;
    }

    await SharedPrefs.saveList(
      SharedPrefsPath.shoppingCart,
      ProductResponse.encode(_listShopping),
    );

    notifyListeners();
  }

  loadShoppingCart() async {
    var dataLoad = await SharedPrefs.readList(SharedPrefsPath.shoppingCart);

    try {
      _listShopping = ProductResponse.decode(dataLoad);
    } catch (e) {
      print('Error shopping cart Provider');
      print(e);
    }

    notifyListeners();
  }
}
