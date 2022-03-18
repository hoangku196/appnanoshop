import 'package:nanoshop_app/app/utils/models/news_response.dart';

import '../../../constants/api_path/api_path.dart';
import '../../../constants/shared_prefs_path/shared_prefs_path.dart';
import '../../networking/api_provider.dart';
import '../../shared_prefs/shared_prefs.dart';

class NewsRepository {
  getListNews({
    String? categoryId,
    required int limit,
    required int page,
    String? newsHot,
    String? keyword,
    String? months,
    String? years,
    String? id,
  }) async {
    List<NewsResponse> _listNews = [];

    Map<String, dynamic> body = new Map<String, dynamic>();

    if (categoryId != null) body['category_id'] = categoryId;

    body['limit'] = limit;

    body['page'] = page;

    if (categoryId != null) body['category_id'] = categoryId;

    if (newsHot != null) body['news_hot'] = newsHot;

    if (keyword != null) body['keyword'] = keyword;

    if (months != null) body['months'] = months;

    if (years != null) body['years'] = years;

    if (id != null) body['_id'] = id;

    var response = await apiShoppingProvider.post(
      url: ApiPath.getNews,
      headers: {
        "token": await SharedPrefs.read(SharedPrefsPath.token),
      },
      body: body,
    );

    (response['data'] as List).forEach(
      (e) {
        _listNews.add(NewsResponse.fromJson(e));
      },
    );

    return _listNews;
  }

  Future<NewsResponse> getDetail({
    required String newsId,
  }) async {
    Map<String, dynamic> body = new Map<String, dynamic>();

    body['type'] = "news";
    body['id'] = newsId;

    var response = await apiShoppingProvider.post(
      url: ApiPath.getDetail,
      headers: {
        "token": await SharedPrefs.read(SharedPrefsPath.token),
      },
      body: body,
    );

    return NewsResponse.fromJson(response);
  }
}
