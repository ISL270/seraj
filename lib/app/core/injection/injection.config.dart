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
import 'package:athar/app/features/azkar/data/azkar_isar_source.dart' as _i31;
import 'package:athar/app/features/azkar/domain/azkar_repository.dart' as _i196;
import 'package:athar/app/features/azkar/presentation/bloc/azkar_bloc.dart' as _i1069;
import 'package:athar/app/features/azkar/sub_features/azkar_tag/data/azkar_tag_isar_source.dart'
    as _i89;
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar_source.dart' as _i53;
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart' as _i143;
import 'package:athar/app/features/daleel/presentation/bloc/daleel_bloc.dart' as _i722;
import 'package:athar/app/features/daleel/sub_features/add_edit_athar/presentation/cubit/add_edit_athar_cubit.dart'
    as _i887;
import 'package:athar/app/features/daleel/sub_features/add_edit_hadith/presentation/cubit/add_edit_hadith_cubit.dart'
    as _i24;
import 'package:athar/app/features/daleel/sub_features/add_edit_other/presentation/cubit/add_or_edit_other_cubit.dart'
    as _i966;
import 'package:athar/app/features/daleel/sub_features/tags/data/daleel_tag_isar_source.dart'
    as _i663;
import 'package:athar/app/features/dua/data/dua_isar_source.dart' as _i500;
import 'package:athar/app/features/dua/domain/dua_repository.dart' as _i1008;
import 'package:athar/app/features/dua/sub_features/add_or_edit_dua/cubit/add_or_edit_dua_cubit.dart'
    as _i737;
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar_source.dart' as _i183;
import 'package:athar/app/features/settings/data/sources/local/settings_isar_source.dart' as _i387;
import 'package:athar/app/features/settings/domain/settings_repository.dart' as _i257;
import 'package:athar/app/features/settings/settings/settings_bloc.dart' as _i240;
import 'package:athar/app/features/settings/sub_features/tags_details/domain/tags_repository.dart'
    as _i317;
import 'package:athar/app/features/settings/sub_features/tags_details/presentation/cubit/tags_cubit.dart'
    as _i1070;
import 'package:athar/app/features/splash/bloc/splash_bloc.dart' as _i169;
import 'package:athar/app/features/splash/domain/repository/auth_repository.dart' as _i452;
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
    gh.singleton<_i31.AzkarIsarSource>(() => _i31.AzkarIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i89.AzkarTagIsarSource>(() => _i89.AzkarTagIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i53.DaleelIsarSource>(() => _i53.DaleelIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i663.DaleelTagIsarSource>(
        () => _i663.DaleelTagIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i500.DuaIsarSource>(() => _i500.DuaIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i183.DuaTagIsarSource>(() => _i183.DuaTagIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i387.SettingsIsarSource>(() => _i387.SettingsIsarSource(gh<_i651.IsarService>()));
    gh.singleton<_i317.TagsRepository>(() => _i317.TagsRepository(
          gh<_i183.DuaTagIsarSource>(),
          gh<_i663.DaleelTagIsarSource>(),
          gh<_i89.AzkarTagIsarSource>(),
        ));
    gh.singleton<_i143.DaleelRepository>(() => _i143.DaleelRepository(
          gh<_i53.DaleelIsarSource>(),
          gh<_i663.DaleelTagIsarSource>(),
        ));
    gh.factory<_i722.DaleelBloc>(() => _i722.DaleelBloc(gh<_i143.DaleelRepository>()));
    gh.factory<_i887.AddOrEditAtharCubit>(
        () => _i887.AddOrEditAtharCubit(gh<_i143.DaleelRepository>()));
    gh.factory<_i966.AddOrEditOtherCubit>(
        () => _i966.AddOrEditOtherCubit(gh<_i143.DaleelRepository>()));
    gh.singleton<_i1070.TagsCubit>(() => _i1070.TagsCubit(gh<_i317.TagsRepository>()));
    gh.singleton<_i196.AzkarRepository>(() => _i196.AzkarRepository(
          gh<_i31.AzkarIsarSource>(),
          gh<_i89.AzkarTagIsarSource>(),
        ));
    gh.singleton<_i452.AuthRepository>(
      () => _i452.AuthRepository(gh<_i59.FirebaseAuth>()),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i1008.DuaRepository>(() => _i1008.DuaRepository(
          gh<_i500.DuaIsarSource>(),
          gh<_i183.DuaTagIsarSource>(),
        ));
    gh.factory<_i1069.AzkarBloc>(() => _i1069.AzkarBloc(gh<_i196.AzkarRepository>()));
    gh.factory<_i24.AddOrEditHadithCubit>(
        () => _i24.AddOrEditHadithCubit(gh<_i143.DaleelRepository>()));
    gh.singleton<_i257.SettingsRepository>(
        () => _i257.SettingsRepository(gh<_i387.SettingsIsarSource>()));
    gh.singleton<_i737.AddOrEditDuaCubit>(
        () => _i737.AddOrEditDuaCubit(gh<_i1008.DuaRepository>()));
    gh.factory<_i169.SplashBloc>(() => _i169.SplashBloc(gh<_i452.AuthRepository>()));
    gh.factory<_i240.SettingsBloc>(() => _i240.SettingsBloc(gh<_i257.SettingsRepository>()));
    return this;
  }
}

class _$AuthModule extends _i982.AuthModule {}
