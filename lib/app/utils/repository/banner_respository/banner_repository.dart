import 'package:nanoshop_app/app/constants/api_path/api_path.dart';
import 'package:nanoshop_app/app/utils/networking/api_provider.dart';

import '../../../constants/shared_prefs_path/shared_prefs_path.dart';
import '../../shared_prefs/shared_prefs.dart';

class BannerRepository {
  Future<List<String>> getBanner({
    required String groupId,
    int limit = 5,
  }) async {
    List<String> _listImageSrc = [];

    var response = await apiShoppingProvider.post(
      url: ApiPath.getBanner,
      headers: {
        "token": await SharedPrefs.read(SharedPrefsPath.token),
      },
      body: {
        "group_id": groupId,
        "limit": limit,
      },
    );

    (response['data'] as Map<String, dynamic>).values.forEach(
      (element) {
        _listImageSrc.add(element['banner_src']);
      },
    );

    return _listImageSrc;
  }
}
