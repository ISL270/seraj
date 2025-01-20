import 'package:athar/app/core/extension_methods/getit_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/routing/go_router_refresh_stream.dart';
import 'package:athar/app/core/routing/go_router_state_extension.dart';
import 'package:athar/app/features/add_athar/presentation/add_athar_screen.dart';
import 'package:athar/app/features/add_athar/presentation/cubit/add_athar_cubit.dart';
import 'package:athar/app/features/add_dua/presentation/add_dua_screen.dart';
import 'package:athar/app/features/add_hadith/presentation/add_hadith_screen.dart';
import 'package:athar/app/features/add_hadith/presentation/cubit/add_hadith_cubit.dart';
import 'package:athar/app/features/add_other/presentation/add_other_screen.dart';
import 'package:athar/app/features/add_other/presentation/cubit/add_other_cubit.dart';
import 'package:athar/app/features/aya/presentation/add_new_ayah.dart';
import 'package:athar/app/features/azkar/presentation/azkar_screen.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/presentation/bloc/daleel_bloc.dart';
import 'package:athar/app/features/daleel/presentation/daleel_screen.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:athar/app/features/dua/presentation/bloc/dua_bloc.dart';
import 'package:athar/app/features/dua/presentation/dua_details/bloc/dua_details_bloc.dart';
import 'package:athar/app/features/dua/presentation/dua_details/dua_details_screen.dart';
import 'package:athar/app/features/dua/presentation/dua_screen.dart';
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
          navigatorKey: _hadithNavigatorKey,
          routes: [
            GoRoute(
              name: DaleelScreen.name,
              path: '/${DaleelScreen.name}',
              pageBuilder: (context, state) => NoTransitionPage(
                child: BlocProvider(
                  create: (context) => DaleelBloc(getIt.get<DaleelRepository>()),
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
                      create: (_) => AddHadithCubit(getIt.get<DaleelRepository>()),
                      child: const AddHadith(),
                    ),
                  ),
                ),
                GoRoute(
                  name: AddAtharScreen.name,
                  path: AddAtharScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (context) => AddAtharCubit(getIt.get<DaleelRepository>()),
                      child: const AddAtharScreen(),
                    ),
                  ),
                ),
                GoRoute(
                  name: AddNewAyah.name,
                  path: AddNewAyah.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) {
                    // Pass the Aya model using the `extra` parameter
                    return const CupertinoPage(
                      child: AddNewAyah(),
                    );
                  },
                ),
                GoRoute(
                  name: AddOtherScreen.name,
                  path: AddOtherScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (context) => AddOtherCubit(getIt.get<DaleelRepository>()),
                      child: const AddOtherScreen(),
                    ),
                  ),
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
              pageBuilder: (context, state) => NoTransitionPage(
                child: BlocProvider(
                  create: (context) => DuaBloc(getIt.get<DuaRepository>()),
                  child: const DuasScreen(),
                ),
              ),
              routes: [
                GoRoute(
                  name: AddDuaScreen.name,
                  path: AddDuaScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => const CupertinoPage(
                    fullscreenDialog: true,
                    child: AddDuaScreen(),
                  ),
                ),
                GoRoute(
                  name: DuaDetailsScreen.name,
                  path: DuaDetailsScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) {
                    final dua = state.extra! as Dua;
                    return BlocProvider(
                      create: (context) => DuaDetailsBloc(getIt.get<DuaRepository>(), dua),
                      child: DuaDetailsScreen(dua),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _azkarNavigatorKey,
          routes: [
            GoRoute(
              name: AzkarScreen.name,
              path: '/${AzkarScreen.name}',
              pageBuilder: (context, state) => const NoTransitionPage(child: AzkarScreen()),
            ),
          ],
        ),
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
  refreshListenable: GoRouterRefreshStream(getIt.authBloc.stream.where((state) => state.isSuccess)),
  redirect: (context, state) {
    // If the user is not logged in, they need to login.
    // Bundle the location the user is coming from into a query parameter
    final fromloc = (state.isGoingToHome || state.isLoggingOut) ? '' : state.matchedLocation;
    if (!getIt.authBloc.state.data!.isAuthenticated) {
      return state.isGoingToSplash || state.isLoggingIn || state.isSigningUp
          ? null
          : state.namedLocation(
              LoginScreen.name,
              queryParameters: {if (fromloc.isNotEmpty) 'from': fromloc},
            );
    }

    // if the user is logged in, send them where they were going before (or home if they weren't going anywhere)
    if (state.isLoggingIn) {
      return state.uri.queryParameters['from'] ?? state.namedLocation(HomeScreen.homeBranch);
    }

    // no need to redirect at all
    return null;
  },
  //TODO: create an error screen.
  // errorBuilder: (context, state) {},
);

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _hadithNavigatorKey = GlobalKey<NavigatorState>(debugLabel: DaleelScreen.name);
final _duasNavigatorKey = GlobalKey<NavigatorState>(debugLabel: DuasScreen.name);
final _azkarNavigatorKey = GlobalKey<NavigatorState>(debugLabel: AzkarScreen.name);
final _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: SettingsScreen.name);
