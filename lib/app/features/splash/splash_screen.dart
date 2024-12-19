import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/extension_methods/getit_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/features/authentication/presentation/bloc/auth_bloc_extension.dart';
import 'package:athar/app/features/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const name = 'splash';

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          context.goNamed(getIt.authBloc.homeNamedRoute);
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            Assets.icons.appLogo.path,
            width: 150.w,
          ),
        ),
      ),
    );
  }
}
