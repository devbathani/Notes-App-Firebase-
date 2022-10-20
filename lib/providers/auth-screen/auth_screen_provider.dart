import 'package:flutter/cupertino.dart';
import 'package:notes_app/firebase/auth-screen-firebase/auth_screen_firebase.dart';

class AuthScreenProvider extends ChangeNotifier {
  final otpController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String verifyingCode = '';

  Future<void> verifyPhoneNumber(
    BuildContext context,
  ) async {
    verifyingCode = await AuthScreenFirebase().verifyPhoneNumber(
      context,
      phoneNumberController.text,
    );
    notifyListeners();
  }

  Future<void> signIn(
    BuildContext context,
    String smsCode,
  ) {
    return AuthScreenFirebase().signIn(verifyingCode, smsCode, context);
  }
}
