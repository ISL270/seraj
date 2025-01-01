import 'package:athar/app/core/extension_methods/getit_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/routing/go_router_refresh_stream.dart';
import 'package:athar/app/core/routing/go_router_state_extension.dart';
import 'package:athar/app/features/add_hadith/presentation/add_hadith_screen.dart';
import 'package:athar/app/features/add_hadith/presentation/cubit/add_hadith_cubit.dart';
import 'package:athar/app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:athar/app/features/aya/presentation/add_new_ayah.dart';
import 'package:athar/app/features/aya/presentation/aya_search.dart';
import 'package:athar/app/features/azkar/presentation/azkar_screen.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/presentation/bloc/daleel_bloc.dart';
import 'package:athar/app/features/daleel/presentation/daleel_screen.dart';
import 'package:athar/app/features/duas/presentation/duas_screen.dart';
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
import 'package:flutter_quran/flutter_quran.dart';
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
      builder: (_, __, navigationShell) =>
          HomeScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _hadithNavigatorKey,
          routes: [
            GoRoute(
              name: DaleelScreen.name,
              path: '/${DaleelScreen.name}',
              pageBuilder: (context, state) => NoTransitionPage(
                child: BlocProvider(
                  create: (context) => DaleelBloc(),
                  child: const DaleelScreen(),
                ),
              ),
              routes: [
                GoRoute(
                  name: AddHadith.name,
                  path: AddHadith.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (_) =>
                          AddHadithCubit(getIt.get<DaleelRepository>()),
                      child: const AddHadith(),
                    ),
                  ),
                ),
                GoRoute(
                  name: AddNewAyah.name,
                  path: AddNewAyah.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) {
                    // Pass the Aya model using the `extra` parameter
                    final ayah = state.extra! as List<Ayah>;
                    return CupertinoPage(
                      child: AddNewAyah(ayah: ayah),
                    );
                  },
                ),
                GoRoute(
                  name: AyaSearch.name,
                  path: AyaSearch.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) {
                    return const CupertinoPage(
                      child: AyaSearch(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _duasNavigatorKey,
          routes: [
            GoRoute(
              name: DuasScreen.name,
              path: '/${DuasScreen.name}',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: DuasScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _azkarNavigatorKey,
          routes: [
            GoRoute(
              name: AzkarScreen.name,
              path: '/${AzkarScreen.name}',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: AzkarScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              name: SettingsScreen.name,
              path: '/${SettingsScreen.name}',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingsScreen()),
            ),
          ],
        ),
      ],
    ),
  ],
  refreshListenable: GoRouterRefreshStream(
      getIt.authBloc.stream.where((state) => state.isSuccess)),
  redirect: (context, state) {
    // If the user is not logged in, they need to login.
    // Bundle the location the user is coming from into a query parameter
    final fromloc = (state.isGoingToHome || state.isLoggingOut)
        ? ''
        : state.matchedLocation;
    if (!getIt.authBloc.state.isAuthenticated) {
      return state.isGoingToSplash || state.isLoggingIn || state.isSigningUp
          ? null
          : state.namedLocation(
              LoginScreen.name,
              queryParameters: {if (fromloc.isNotEmpty) 'from': fromloc},
            );
    }

    // if the user is logged in, send them where they were going before (or home if they weren't going anywhere)
    if (state.isLoggingIn) {
      return state.uri.queryParameters['from'] ??
          state.namedLocation(HomeScreen.homeBranch);
    }

    // no need to redirect at all
    return null;
  },
  //TODO: create an error screen.
  // errorBuilder: (context, state) {},
);

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _hadithNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: DaleelScreen.name);
final _duasNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: DuasScreen.name);
final _azkarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: AzkarScreen.name);
final _settingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: SettingsScreen.name);
