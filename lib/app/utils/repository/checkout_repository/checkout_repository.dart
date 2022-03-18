import 'package:nanoshop_app/app/utils/models/province_select_model.dart';

import '../../../constants/api_path/api_path.dart';
import '../../../constants/shared_prefs_path/shared_prefs_path.dart';
import '../../networking/api_provider.dart';
import '../../shared_prefs/shared_prefs.dart';

class CheckoutRepository {
  Future<List<ProvinceSelectModel>> getMethod() async {
    List<ProvinceSelectModel> _listProvinces = [];

    await Future.delayed(Duration(seconds: 5));

    var response = await apiShoppingProvider.get(
      url: ApiPath.getPaymentMethod,
      headers: {
        "token": await SharedPrefs.read(SharedPrefsPath.token),
      },
    );

    (response as Map<String, dynamic>).forEach(
      (key, value) {
        ProvinceSelectModel model = ProvinceSelectModel(
          id: key.toString(),
          name: value.toString(),
        );
        _listProvinces.add(model);
      },
    );

    return _listProvinces;
  }
}
