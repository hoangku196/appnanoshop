import 'package:nanoshop_app/app/utils/models/product_response.dart';

import '../../../constants/api_path/api_path.dart';
import '../../../constants/shared_prefs_path/shared_prefs_path.dart';
import '../../models/category_product_response.dart';
import '../../networking/api_provider.dart';
import '../../shared_prefs/shared_prefs.dart';

class ProductRepository {
  getCategory({required String type}) async {
    List<CategoryProductResponse> _listCategory = [];

    var response = await apiShoppingProvider.post(
      url: ApiPath.getCategory,
      headers: {
        "token": await SharedPrefs.read(SharedPrefsPath.token),
      },
      body: {
        "type": type,
      },
    );

    (response as Map<String, dynamic>).values.forEach(
      (element) {
        _listCategory.add(
          CategoryProductResponse.fromJson(element),
        );
      },
    );

    return _listCategory;
  }

  getListProduct({
    String? categoryId,
    int? limit,
    int? page,
    String? isNew,
    String? isHot,
    String? isSelling,
    String? keyword,
  }) async {
    List<ProductResponse> _listProduct = [];

    Map<String, dynamic> body = new Map<String, dynamic>();

    if (categoryId != null) body['category_id'] = categoryId;

    if (limit != null) body['limit'] = limit;

    if (page != null) body['page'] = page;

    if (isNew != null) body['isnew'] = isNew;

    if (isHot != null) body['ishot'] = isHot;

    if (isSelling != null) body['isselling'] = isSelling;

    if (keyword != null) body['keyword'] = keyword;

    var response = await apiShoppingProvider.post(
      url: ApiPath.getProduct,
      headers: {
        "token": await SharedPrefs.read(SharedPrefsPath.token),
      },
      body: body,
    );

    (response['data'] as Map<String, dynamic>).values.forEach(
      (element) {
        _listProduct.add(
          ProductResponse.fromJson(element),
        );
      },
    );

    return _listProduct;
  }
}
