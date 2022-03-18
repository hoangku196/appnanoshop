abstract class LoginEvent {}

class AccountChanged extends LoginEvent {
  final String account;

  AccountChanged({
    required this.account,
  });
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({
    required this.password,
  });
}

class SignInUser extends LoginEvent {
  final String account;
  final String password;

  SignInUser({
    required this.account,
    required this.password,
  });
}

class SignInGoogle extends LoginEvent {}

class SignInFaceBook extends LoginEvent {}

class SignOut extends LoginEvent {}

class CloseFailureDialog extends LoginEvent {}
