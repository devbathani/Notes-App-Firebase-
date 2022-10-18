import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class SplashScreenProvider extends ChangeNotifier {
  navigatetoAuthScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    AutoRouter.of(context).pushNamed('auth');
    notifyListeners();
  }
}
