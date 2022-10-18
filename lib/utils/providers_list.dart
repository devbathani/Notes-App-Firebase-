import 'package:notes_app/providers/splash-screen/splash_screen.dart';
import 'package:provider/provider.dart';

final List providers = [
  ChangeNotifierProvider<SplashScreenProvider>(
    create: (context) => SplashScreenProvider(),
    lazy: false,
  ),
];
