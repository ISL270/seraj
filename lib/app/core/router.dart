import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:athar/app/features/azkar/domain/azkar_repository.dart';
import 'package:athar/app/features/azkar/presentation/azkar_screen.dart';
import 'package:athar/app/features/azkar/presentation/bloc/azkar_bloc.dart';
import 'package:athar/app/features/azkar/sub_features/add_azkar/presentation/add_azkar_screen.dart';
import 'package:athar/app/features/azkar/sub_features/add_azkar/presentation/cubit/add_azkar_cubit.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_details/bloc/azkar_details_bloc.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_details/presentation/azkar_details_screen.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/presentation/bloc/daleel_bloc.dart';
import 'package:athar/app/features/daleel/presentation/daleel_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_athar/presentation/add_athar_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_athar/presentation/cubit/add_athar_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/add_aya/presentation/add_new_ayah.dart';
import 'package:athar/app/features/daleel/sub_features/add_hadith/presentation/add_hadith_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_hadith/presentation/cubit/add_hadith_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/add_other/presentation/add_other_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_other/presentation/cubit/add_other_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_details/bloc/daleel_details_bloc.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_details/presentation/daleel_details_screen.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:athar/app/features/dua/presentation/bloc/dua_bloc.dart';
import 'package:athar/app/features/dua/presentation/dua_screen.dart';
import 'package:athar/app/features/dua/sub_features/add_dua/add_dua_screen.dart';
import 'package:athar/app/features/dua/sub_features/dua_details/bloc/dua_details_bloc.dart';
import 'package:athar/app/features/dua/sub_features/dua_details/dua_details_screen.dart';
import 'package:athar/app/features/home/presentaion/home.dart';
import 'package:athar/app/features/settings/settings_screen.dart';
import 'package:athar/app/features/settings/sub_features/tags_details/presentation/tags_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/${DaleelScreen.name}',
  routes: [
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
                GoRoute(
                  name: TagsScreen.name,
                  path: TagsScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => const CupertinoPage(
                    fullscreenDialog: true,
                    child: TagsScreen(),
                  ),
                ),
                GoRoute(
                  name: DaleelDetailsScreen.name,
                  path: DaleelDetailsScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (context) =>
                          DaleelDetailsBloc(getIt.get<DaleelRepository>(), state.extra! as Daleel),
                      child: DaleelDetailsScreen(
                        state.extra! as Daleel,
                      ),
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
              pageBuilder: (context, state) => NoTransitionPage(
                  child: BlocProvider(
                create: (context) => getIt.get<AzkarBloc>(),
                child: const AzkarScreen(),
              )),
              routes: [
                GoRoute(
                  name: AddAzkarScreen.name,
                  path: AddAzkarScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (context) => AddAzkarCubit(getIt.get<AzkarRepository>()),
                      child: const AddAzkarScreen(),
                    ),
                  ),
                ),
                GoRoute(
                    name: AzkarDetailsScreen.name,
                    path: AzkarDetailsScreen.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final azkar = state.extra! as Azkar;
                      return BlocProvider(
                        create: (context) => AzkarDetailsBloc(getIt.get<AzkarRepository>(), azkar),
                        child: AzkarDetailsScreen(azkar),
                      );
                    }),
              ],
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
);

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _hadithNavigatorKey = GlobalKey<NavigatorState>(debugLabel: DaleelScreen.name);
final _duasNavigatorKey = GlobalKey<NavigatorState>(debugLabel: DuasScreen.name);
final _azkarNavigatorKey = GlobalKey<NavigatorState>(debugLabel: AzkarScreen.name);
final _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: SettingsScreen.name);
