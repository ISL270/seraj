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
import 'package:athar/app/features/daleel/sub_features/add_hadith/presentation/cubit/add_hadith_cubit.dart'
    as _i397;
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar_source.dart'
    as _i53;
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart'
    as _i143;
import 'package:athar/app/features/daleel/presentation/bloc/daleel_bloc.dart'
    as _i722;
import 'package:athar/app/features/dua/data/dua_isar_source.dart' as _i500;
import 'package:athar/app/features/dua/domain/dua_repository.dart' as _i1008;
import 'package:athar/app/features/dua/sub_features/add_dua/cubit/add_dua_cubit.dart'
    as _i737;
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
    await gh.singletonAsync<_i651.IsarService>(
      () => _i651.IsarService.create(),
      preResolve: true,
    );
    gh.singleton<_i560.L10nService>(() => _i560.L10nService());
    gh.singleton<_i516.FirestoreService>(() => _i516.FirestoreService());
    gh.singleton<_i59.FirebaseAuth>(() => authModule.auth);
    gh.singleton<_i116.GoogleSignIn>(() => authModule.googleSignIn);
    gh.singleton<_i387.SettingsIsarSource>(
        () => _i387.SettingsIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i53.DaleelIsarSource>(
        () => _i53.DaleelIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i500.DuaIsarSource>(
        () => _i500.DuaIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i1008.DuaRepository>(
        () => _i1008.DuaRepository(gh<_i500.DuaIsarSource>()));
    gh.singleton<_i143.DaleelRepository>(
        () => _i143.DaleelRepository(gh<_i53.DaleelIsarSource>()));
    gh.factory<_i397.AddHadithCubit>(
        () => _i397.AddHadithCubit(gh<_i143.DaleelRepository>()));
    gh.singleton<_i257.SettingsRepository>(
        () => _i257.SettingsRepository(gh<_i387.SettingsIsarSource>()));
    gh.singleton<_i737.AddDuaCubit>(
        () => _i737.AddDuaCubit(gh<_i1008.DuaRepository>()));
    gh.factory<_i240.SettingsBloc>(
        () => _i240.SettingsBloc(gh<_i257.SettingsRepository>()));
    gh.factory<_i722.DaleelBloc>(
        () => _i722.DaleelBloc(gh<_i143.DaleelRepository>()));
    return this;
  }
}

class _$AuthModule extends _i982.AuthModule {}
