import 'package:athar/app/core/extension_methods/getit_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/features/hadith/presentation/hadith_screen.dart';
import 'package:athar/app/features/login/login_screen.dart';
import 'package:athar/app/features/settings/settings_screen.dart';
import 'package:athar/app/features/sign_up/presentation/sign_up_screen.dart';
import 'package:athar/app/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

extension GoRouterStateX on GoRouterState {
  bool get isLoggingIn => matchedLocation == namedLocation(LoginScreen.name);
  bool get isSigningUp => matchedLocation == namedLocation(SignUpScreen.name);
  bool get isLoggingOut => matchedLocation == namedLocation(SettingsScreen.name);
  bool get isGoingToSplash => matchedLocation == namedLocation(SplashScreen.name);
  bool get isGoingToHome => matchedLocation == namedLocation(HadithScreen.name);
}
