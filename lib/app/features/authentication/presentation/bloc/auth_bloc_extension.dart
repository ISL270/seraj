import 'package:athar/app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:athar/app/features/hadith/presentation/hadith_screen.dart';
import 'package:athar/app/features/home/presentaion/home.dart';
import 'package:athar/app/features/login/login_screen.dart';
import 'package:athar/app/features/settings/settings_screen.dart';
import 'package:athar/app/features/splash/splash_screen.dart';

extension AuthBlocX on AuthBloc {
  String get homeNamedRoute {
    if (!state.isAuthenticated) {
      return LoginScreen.name;
    }

    if (state.user?.id == null) {
      return SplashScreen.name;
    }

    return HadithScreen.name;
    // return SettingsScreen
    //     .name; // Replace with the desired authenticated home route.
  }
}
