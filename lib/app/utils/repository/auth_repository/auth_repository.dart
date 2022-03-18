import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:nanoshop_app/app/constants/api_path/api_path.dart';
import 'package:nanoshop_app/app/utils/networking/api_provider.dart';

class AuthRepository {
  Future<dynamic> getToken() async {
    var randomText = DateTime.now().millisecondsSinceEpoch * 2;
    var token =
        sha1.convert(utf8.encode(randomText.toString() + ApiPath.token));
    return await apiShoppingProvider.get(
      url: ApiPath.getToken,
      headers: {
        "token": token.toString(),
      },
      params: {
        "string": randomText,
      },
    );
  }
}
