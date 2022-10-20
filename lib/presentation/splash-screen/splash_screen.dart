import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/gen/assets.gen.dart';
import 'package:notes_app/providers/splash-screen/splash_screen_provider.dart';
import 'package:notes_app/utils/text_style.dart';
import 'package:notes_app/utils/titles.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashScreenProvider>(context, listen: false)
        .navigatetoAuthScreen(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.backgroundImage.path,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 200.h,
                    ),
                    Image.asset(
                      Assets.splashLogo.path,
                      height: 100.h,
                      width: 100.w,
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(
                      welcomeToNotes,
                      style: whiteSubHeading,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
