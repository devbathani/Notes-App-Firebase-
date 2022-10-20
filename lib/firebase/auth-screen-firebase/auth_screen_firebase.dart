import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthScreenFirebase {
  final firebaseAuth = FirebaseAuth.instance;
  String verifyingCode = '';
  Future<String> verifyPhoneNumber(
    BuildContext context,
    String phoneNumber,
  ) async {
    log("Phone number : $phoneNumber");
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (phoneCredential) async {
        await firebaseAuth.signInWithCredential(phoneCredential).then(
          (value) {
            if (value.user != null) {
              AutoRouter.of(context).pushNamed('home');
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        log(e.message.toString());
      },
      codeSent: (verficationCode, resendToken) {
        verifyingCode = verficationCode;
      },
      codeAutoRetrievalTimeout: (verificationID) {
        verifyingCode = verificationID;
      },
      timeout: const Duration(seconds: 120),
    );
    return verifyingCode;
  }

  Future<void> signIn(
      String verificationId, String smsCode, BuildContext context) {
    return firebaseAuth
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      ),
    )
        .then(
      (value) {
        if (value.user != null) {
          AutoRouter.of(context).pushNamed('home');
        }
      },
    );
  }
}
