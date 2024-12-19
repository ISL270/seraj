import 'package:athar/app/core/extension_methods/getit_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/routing/go_router_refresh_stream.dart';
import 'package:athar/app/core/routing/go_router_state_extension.dart';
import 'package:athar/app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:athar/app/features/authentication/presentation/bloc/auth_bloc_extension.dart';
import 'package:athar/app/features/home/presentaion/home.dart';
import 'package:athar/app/features/login/cubit/login_cubit.dart';
import 'package:athar/app/features/login/login_screen.dart';
import 'package:athar/app/features/settings/settings_screen.dart';
import 'package:athar/app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:athar/app/features/sign_up/presentation/sign_up_screen.dart';
import 'package:athar/app/features/splash/bloc/splash_bloc.dart';
import 'package:athar/app/features/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.name,
      builder: (context, state) => BlocProvider(
        create: (context) => SplashBloc(),
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      name: LoginScreen.name,
      path: '/${LoginScreen.name}',
      builder: (context, state) => BlocProvider(
        create: (_) => LoginCubit(getIt.authRepo),
        child: const LoginScreen(),
      ),
      routes: [
        GoRoute(
          name: SignUpScreen.name,
          path: SignUpScreen.name,
          builder: (context, state) => BlocProvider(
            create: (_) => SignUpCubit(getIt.authRepo),
            child: const SignUpScreen(),
          ),
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => HomeScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              name: SettingsScreen.name,
              path: '/${SettingsScreen.name}',
              pageBuilder: (context, state) => const NoTransitionPage(child: SettingsScreen()),
            ),
          ],
        ),
      ],
    ),
  ],
  refreshListenable: GoRouterRefreshStream(
    getIt.authBloc.stream.where((state) => state.isSuccess),
  ),
  redirect: (context, state) {
    // If the user is not logged in, they need to login.
    // Bundle the location the user is coming from into a query parameter
    final fromloc = (state.isGoingToHome || state.isLoggingOut) ? '' : state.matchedLocation;
    if (!getIt.authBloc.state.isAuthenticated) {
      return state.isGoingToSplash || state.isLoggingIn || state.isSigningUp
          ? null
          : state.namedLocation(
              LoginScreen.name,
              queryParameters: {if (fromloc.isNotEmpty) 'from': fromloc},
            );
    }

    // if the user is logged in, send them where they were going before (or
    // home if they weren't going anywhere)
    if (state.isLoggingIn) {
      return state.uri.queryParameters['from'] ??
          state.namedLocation(getIt.authBloc.homeNamedRoute);
    }

    // no need to redirect at all
    return null;
  },
  //TODO: create an error screen.
  // errorBuilder: (context, state) {},
);

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: SettingsScreen.name);
