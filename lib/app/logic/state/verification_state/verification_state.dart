class VerificationState {}

class Verifying extends VerificationState {}

class Verified extends VerificationState {}

class VerificationFailed extends VerificationState {
  final String error;

  VerificationFailed({
   required this.error,
  });
}
