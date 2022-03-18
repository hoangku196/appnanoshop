abstract class SignUpEvent {}

class SignUp extends SignUpEvent {
  final String name, account, password, passwordConfirm;

  SignUp({
    required this.name,
    required this.account,
    required this.password,
    required this.passwordConfirm,
  });
}

class CloseSignUpFailureDialog extends SignUpEvent {}
