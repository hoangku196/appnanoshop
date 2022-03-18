import 'package:nanoshop_app/app/constants/api_path/api_path.dart';
import 'package:nanoshop_app/app/constants/shared_prefs_path/shared_prefs_path.dart';
import 'package:nanoshop_app/app/utils/networking/api_provider.dart';
import 'package:nanoshop_app/app/utils/shared_prefs/shared_prefs.dart';

class LoginRepository {
  Future<dynamic> login({
    required String account,
    required String password,
  }) async {
    return await apiShoppingProvider.post(url: ApiPath.login, headers: {
      "token": await SharedPrefs.read(SharedPrefsPath.token),
    }, body: {
      "username": account,
      "password": password,
    });
  }

  Future<dynamic> signUp({
    required String account,
    required String name,
    required String password,
    required String passwordConfirm,
  }) async {
    return await apiShoppingProvider.post(url: ApiPath.signUp, headers: {
      "token": await SharedPrefs.read(SharedPrefsPath.token),
    }, body: {
      "phone": account,
      "name": name,
      "password": password,
      "passwordConfirm": passwordConfirm,
    });
  }
}
