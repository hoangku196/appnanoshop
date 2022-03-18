abstract class VerificationEvent {}

class CreateVerification extends VerificationEvent {
  final String phoneNumber;

  CreateVerification({
    required this.phoneNumber,
  });
}

class ConfirmCode extends VerificationEvent {
  final String code;

  ConfirmCode({
    required this.code,
  });
}

class CloseVerificationFailedDialog extends VerificationEvent {}
