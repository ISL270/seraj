// ignore_for_file: cast_nullable_to_non_nullable

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
import 'package:athar/app/features/daleel/sub_features/add_edit_athar/presentation/add_edit_athar_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_athar/presentation/cubit/add_edit_athar_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_ayah/presentation/add_edit_ayah.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_ayah/presentation/cubit/add_edit_aya_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_hadith/presentation/add_edit_hadith_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_hadith/presentation/cubit/add_edit_hadith_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_other/presentation/add_other_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_other/presentation/cubit/add_other_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_details/bloc/daleel_details_bloc.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_details/presentation/daleel_details_screen.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:athar/app/features/dua/presentation/bloc/dua_bloc.dart';
import 'package:athar/app/features/dua/presentation/dua_screen.dart';
import 'package:athar/app/features/dua/sub_features/add_dua/add_dua_screen.dart';
import 'package:athar/app/features/dua/sub_features/add_dua/cubit/add_dua_cubit.dart';
import 'package:athar/app/features/dua/sub_features/dua_details/bloc/dua_details_bloc.dart';
import 'package:athar/app/features/dua/sub_features/dua_details/dua_details_screen.dart';
import 'package:athar/app/features/home/presentaion/home.dart';
import 'package:athar/app/features/settings/settings_screen.dart';
import 'package:athar/app/features/settings/sub_features/tags_details/domain/tags_repository.dart';
import 'package:athar/app/features/settings/sub_features/tags_details/presentation/cubit/tags_cubit.dart';
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
                  name: AddOrEditHadith.name,
                  path: AddOrEditHadith.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (_) => AddOrEditHadithCubit(getIt.get<DaleelRepository>())
                        ..initializeHadith(state.extra as int?),
                      child: const AddOrEditHadith(),
                    ),
                  ),
                ),
                GoRoute(
                  name: AddOrEditAtharScreen.name,
                  path: AddOrEditAtharScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (context) => AddOrEditAtharCubit(getIt.get<DaleelRepository>())
                        ..initializeAthar(state.extra as int?),
                      child: const AddOrEditAtharScreen(),
                    ),
                  ),
                ),
                GoRoute(
                  name: AddEditAyah.name,
                  path: AddEditAyah.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) {
                    return CupertinoPage(
                      child: BlocProvider(
                        create: (_) => AddEditAyahCubit(
                          ayaRepository: getIt.get<DaleelRepository>(),
                        )..initializeAya(state.extra as int?),
                        child: const AddEditAyah(),
                      ),
                    );
                  },
                ),
                GoRoute(
                  name: AddOrEditOther.name,
                  path: AddOrEditOther.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (context) => AddOrEditOtherCubit(getIt.get<DaleelRepository>())
                        ..initializeOther(state.extra as int?),
                      child: const AddOrEditOther(),
                    ),
                  ),
                ),
                GoRoute(
                  name: TagsScreen.name,
                  path: TagsScreen.name,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (context) => TagsCubit(getIt.get<TagsRepository>()),
                      child: const TagsScreen(),
                    ),
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
                      child: DaleelDetailsScreen(state.extra! as Daleel),
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
                  pageBuilder: (context, state) => CupertinoPage(
                    fullscreenDialog: true,
                    child: BlocProvider(
                      create: (_) => AddDuaCubit(getIt.get<DuaRepository>())
                        ..initializeDua(state.extra as int?),
                      child: const AddDuaScreen(),
                    ),
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
