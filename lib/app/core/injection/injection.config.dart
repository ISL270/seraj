// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:athar/app/core/firestore/firestore_service.dart' as _i516;
import 'package:athar/app/core/injection/auth_module.dart' as _i982;
import 'package:athar/app/core/isar/isar_service.dart' as _i651;
import 'package:athar/app/core/l10n/l10n_service.dart' as _i560;
import 'package:athar/app/features/add_dua/presentation/cubit/add_dua_cubit.dart'
    as _i910;
import 'package:athar/app/features/authentication/data/data_sources/local/user_isar_source.dart'
    as _i602;
import 'package:athar/app/features/authentication/data/data_sources/remote/user_firestore_source.dart'
    as _i683;
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart'
    as _i842;
import 'package:athar/app/features/authentication/domain/repositories/user_repository.dart'
    as _i92;
import 'package:athar/app/features/authentication/presentation/bloc/auth_bloc.dart'
    as _i562;
import 'package:athar/app/features/duas/data/data_source/local/aya_isar_source.dart'
    as _i423;
import 'package:athar/app/features/duas/data/data_source/remote/dua_firestore_source.dart'
    as _i446;
import 'package:athar/app/features/duas/domain/dua_repository.dart' as _i194;
import 'package:athar/app/features/settings/data/sources/local/settings_isar_source.dart'
    as _i387;
import 'package:athar/app/features/settings/domain/settings_repository.dart'
    as _i257;
import 'package:athar/app/features/settings/settings/settings_bloc.dart'
    as _i240;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final authModule = _$AuthModule();
    gh.singleton<_i516.FirestoreService>(() => _i516.FirestoreService());
    gh.singleton<_i59.FirebaseAuth>(() => authModule.auth);
    gh.singleton<_i116.GoogleSignIn>(() => authModule.googleSignIn);
    await gh.singletonAsync<_i651.IsarService>(
      () => _i651.IsarService.create(),
      preResolve: true,
    );
    gh.singleton<_i560.L10nService>(() => _i560.L10nService());
    gh.singleton<_i683.UserFirestoreSource>(
        () => _i683.UserFirestoreSource(gh<_i516.FirestoreService>()));
    gh.singleton<_i602.UserIsarSource>(
        () => _i602.UserIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i387.SettingsIsarSource>(
        () => _i387.SettingsIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i423.DuaIsarSource>(
        () => _i423.DuaIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i446.DuaFirestoreSource>(
        () => _i446.DuaFirestoreSource(gh<_i516.FirestoreService>()));
    gh.singleton<_i257.SettingsRepository>(
        () => _i257.SettingsRepository(gh<_i387.SettingsIsarSource>()));
    gh.singleton<_i92.UserRepository>(() => _i92.UserRepository(
          gh<_i602.UserIsarSource>(),
          gh<_i683.UserFirestoreSource>(),
        ));
    gh.factory<_i240.SettingsBloc>(
        () => _i240.SettingsBloc(gh<_i257.SettingsRepository>()));
    await gh.singletonAsync<_i842.AuthRepository>(
      () {
        final i = _i842.AuthRepository(
          gh<_i59.FirebaseAuth>(),
          gh<_i116.GoogleSignIn>(),
          gh<_i92.UserRepository>(),
        );
        return i.init().then((_) => i);
      },
      preResolve: true,
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i562.AuthBloc>(
        () => _i562.AuthBloc(gh<_i842.AuthRepository>()));
    gh.singleton<_i194.DuaRepository>(() => _i194.DuaRepository(
          gh<_i842.AuthRepository>(),
          gh<_i446.DuaFirestoreSource>(),
          gh<_i423.DuaIsarSource>(),
        ));
    gh.singleton<_i910.AddDuaCubit>(
        () => _i910.AddDuaCubit(gh<_i194.DuaRepository>()));
    return this;
  }
}

class _$AuthModule extends _i982.AuthModule {}
