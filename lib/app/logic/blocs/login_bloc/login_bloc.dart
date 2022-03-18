import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nanoshop_app/app/constants/shared_prefs_path/shared_prefs_path.dart';
import 'package:nanoshop_app/app/constants/strings_constant/strings_constant.dart';
import 'package:nanoshop_app/app/utils/models/login_response.dart';
import 'package:nanoshop_app/app/utils/repository/login_repository/login_repository.dart';
import 'package:nanoshop_app/app/utils/shared_prefs/shared_prefs.dart';

import '../../../utils/validator/validator.dart';
import '../../event/login_event/login_event.dart';
import '../../state/login_state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({
    required this.loginRepository,
  }) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignInUser) {
      yield LoginLoading();
      await Future.delayed(
        Duration(seconds: 1),
      );
      try {
        LoginResponse loginResponse = LoginResponse.fromJson(
          await loginRepository.login(
              account: event.account, password: event.password),
        );

        await SharedPrefs.save(SharedPrefsPath.user, loginResponse.toJson());

        yield LoginSuccess();
      } on PlatformException {
        yield LoginFailure(
          error: StringsConstant.connectError,
        );
      } catch (e) {
        yield LoginFailure(
          error: e.toString(),
        );
      }
    }

    if (event is SignInGoogle) {
      yield LoginLoading();
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser != null) {
          yield LoginSuccess();
        } else {
          yield LoginFailure(
            error: "Lỗi khi xác thực",
          );
        }
      } catch (e) {
        yield LoginFailure(
          error: e.toString(),
        );
      }
    }

    if (event is SignInFaceBook) {
      yield LoginLoading();
      try {
        final LoginResult result = await FacebookAuth.instance.login();
        if (result.status == LoginStatus.success) {
          final AccessToken accessToken = result.accessToken!;
          yield LoginSuccess();
        } else {
          yield LoginFailure(
            error: result.message,
          );
        }
      } catch (e) {
        yield LoginFailure(
          error: e.toString(),
        );
      }
    }

    if (event is CloseFailureDialog) {
      yield LoginState();
    }
  }
}
