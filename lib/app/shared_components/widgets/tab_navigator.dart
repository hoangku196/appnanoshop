import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabNavigator extends StatelessWidget {
  final dynamic keyId;

  const TabNavigator({
    Key? key,
    this.keyId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(keyId),

    );
  }
}
