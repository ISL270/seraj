import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/features/home/presentaion/home.dart';
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
          context.goNamed(HomeScreen.homeBranch);
        } else if (state is SplashFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.wentWrong)),
          );
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
