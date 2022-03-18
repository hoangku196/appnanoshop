import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../event/verification_event/verification_event.dart';
import '../../state/verification_state/verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc() : super(VerificationState());

  late String _phoneNumber;
  late String _verificationId;

  @override
  Stream<VerificationState> mapEventToState(VerificationEvent event) async* {
    if (event is CreateVerification) {
      _phoneNumber =
          "+84" + event.phoneNumber.substring(1, event.phoneNumber.length);
      try {
        await FirebaseAuth.instance
            .verifyPhoneNumber(
          phoneNumber: _phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
            _verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } on FirebaseAuthException catch (e) {
      } catch (e) {
        yield VerificationFailed(
          error: e.toString(),
        );
      }
    }

    if (event is ConfirmCode) {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: event.code,
      );

      try {
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        yield Verified();
      } catch (e) {
        yield VerificationFailed(
          error: e.toString(),
        );
      }
    }

    if (event is CloseVerificationFailedDialog) {
      yield VerificationState();
    }
  }
}
