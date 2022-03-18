import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoshop_app/app/logic/event/sign_up_event/sign_up_event.dart';
import 'package:nanoshop_app/app/logic/state/sign_up_state/sign_up_state.dart';
import 'package:nanoshop_app/app/utils/repository/login_repository/login_repository.dart';

import '../../../constants/strings_constant/strings_constant.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  LoginRepository loginRepository;

  SignUpBloc({
    required this.loginRepository,
  }) : super(SignUpState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUp) {
      yield Uploading();
      try {
        await loginRepository.signUp(
          name: event.name,
          account: event.account,
          passwordConfirm: event.passwordConfirm,
          password: event.password,
        );

        yield UploadSuccess();
      } on PlatformException {
        yield UploadFailure(
          error: StringsConstant.connectError,
        );
      } catch (e) {
        yield UploadFailure(
          error: e.toString(),
        );
      }
    }

    if (event is CloseSignUpFailureDialog) {
      yield SignUpState();
    }
  }
}
