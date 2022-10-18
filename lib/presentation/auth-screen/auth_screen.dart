import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/gen/assets.gen.dart';
import 'package:notes_app/providers/auth-screen/auth_screen_provider.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:notes_app/utils/text_style.dart';
import 'package:notes_app/utils/titles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthScreenProvider>(
        builder: (context, authState, _) {
          TextEditingController otpController = TextEditingController();
          TextEditingController phoneNumberController = TextEditingController();
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.authBg.path),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Image.asset(
                    Assets.splashLogo.path,
                    height: 100.h,
                    width: 100.w,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    welcomeToNotes,
                    style: whiteSubHeading.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 50.h,
                    width: 300.w,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(2, 0),
                        blurRadius: 5,
                        spreadRadius: 0.05,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(-2, 5),
                        blurRadius: 5,
                        spreadRadius: 0.05,
                      ),
                    ]),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: authState.phoneNumberController,
                      validator: (value) {
                        if (value!.length == 10) {
                          FocusScope.of(context).nextFocus();
                        }
                        return null;
                      },
                      style: whiteSubHeading.copyWith(
                        color: Colors.black54,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        hintText: 'Enter the mobile number',
                        hintStyle: whiteSubHeading.copyWith(
                          color: Colors.black54,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      enablePinAutofill: true,
                      controller: authState.otpController,
                      animationType: AnimationType.fade,
                      errorAnimationDuration: 300,
                      animationDuration: const Duration(milliseconds: 300),
                      onChanged: (otp) async {
                        authState.otpController.text = otp;
                      },
                      keyboardType: TextInputType.number,
                      appContext: context,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldOuterPadding: const EdgeInsets.only(left: 2),
                        borderRadius: BorderRadius.circular(5),
                        selectedColor: Colors.white,
                        fieldHeight: 40.h,
                        fieldWidth: 45.w,
                        inactiveFillColor: Colors.white,
                        activeFillColor: Colors.white,
                        activeColor: Colors.white,
                        inactiveColor: Colors.white,
                        disabledColor: Colors.white,
                      ),
                      cursorColor: const Color(0xff45AD7E),
                      textStyle: whiteSubHeading.copyWith(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            authState.verifyPhoneNumber(context);
                          },
                          child: Text(
                            "Send OTP",
                            style: whiteSubHeading.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          authState.signIn(
                            context,
                            authState.otpController.text,
                          );
                        },
                        child: Container(
                          height: 50.h,
                          width: 120.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: yellowColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
