import 'package:notes_app/providers/auth-screen/auth_screen_provider.dart';
import 'package:notes_app/providers/splash-screen/splash_screen_provider.dart';
import 'package:provider/provider.dart';

final List providers = [
  ChangeNotifierProvider<SplashScreenProvider>(
    create: (context) => SplashScreenProvider(),
    lazy: false,
  ),
  ChangeNotifierProvider<AuthScreenProvider>(
    create: (context) => AuthScreenProvider(),
    lazy: false,
  ),
];
