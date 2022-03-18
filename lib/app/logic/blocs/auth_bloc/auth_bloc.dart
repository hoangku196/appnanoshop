import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoshop_app/app/constants/shared_prefs_path/shared_prefs_path.dart';
import 'package:nanoshop_app/app/utils/models/auth_response.dart';

import '../../../utils/repository/auth_repository/auth_repository.dart';
import '../../../utils/shared_prefs/shared_prefs.dart';
import '../../event/auth_event/auth_event.dart';
import '../../state/auth_state/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(Authenticating());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Authentication) {
      yield AuthLoading();
      await Future.delayed(Duration(seconds: 5));
      try {
        AuthResponse authResponse = AuthResponse.fromJson(
          await authRepository.getToken(),
        );
        SharedPrefs.save(SharedPrefsPath.token, authResponse.token);
        yield AuthSuccess();
      } catch (e) {
        yield AuthFailed(
          error: e.toString(),
        );
      }
    }
  }
}
