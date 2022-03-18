import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nanoshop_app/app/constants/api_path/api_path.dart';

import '../../constants/strings_constant/strings_constant.dart';
import 'exception_networking.dart';

const ApiProvider apiShoppingProvider = ApiProvider(domain: ApiPath.domain);

class ApiProvider {
  final String domain;

  const ApiProvider({
    required this.domain,
  });

  Future<dynamic> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    var responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(this.domain + url),
            headers: headers,
            body: json.encode(body),
          )
          .timeout(
            Duration(seconds: 10),
          );
      responseJson = _responseHandle(response: response);
    } on TimeoutException {
      throw TimeoutException("Kết nối tới server thất bại");
    } on SocketException {
      throw FetchDataException(
        message: StringsConstant.connectError,
      );
    }
    return responseJson['data'];
  }

  Future<dynamic> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async {
    var responseJson;

    if (params != null) {
      for (var i = 0; i < params.length; i++) {
        if (i == 0) {
          url += "?${params.keys.elementAt(i)}=${params.values.elementAt(i)}";
        }
        url += "&${params.keys.elementAt(i)}=${params.values.elementAt(i)}";
      }
    }

    try {
      final response = await http
          .get(
            Uri.parse(this.domain + url),
            headers: headers,
          )
          .timeout(
            Duration(seconds: 10),
          );
      responseJson = _responseHandle(response: response);
    } on TimeoutException {
      throw TimeoutException("Kết nối tới server thất bại");
    } on SocketException {
      throw FetchDataException(
        message: StringsConstant.connectError,
      );
    }
    return responseJson['data'];
  }

  dynamic _responseHandle({
    required http.Response response,
  }) {
    switch (response.statusCode) {
      case 200:
        return _checkCodeResponse(data: json.decode(response.body));
      case 400:
        throw BadRequestException(message: response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            message: "Lỗi khi cố gắng liên lạc với server");
    }
  }

  dynamic _checkCodeResponse({required data}) {
    switch (int.parse(data['code'].toString())) {
      case 1:
        return data;
      case 0:
        throw MessageException(
          message: data['error'].toString(),
        );
    }
  }
}
