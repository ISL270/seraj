import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/arb/app_localizations.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/routing/router.dart';
import 'package:athar/app/core/theming/app_theme.dart';
import 'package:athar/app/features/azkar/domain/azkar_repository.dart';
import 'package:athar/app/features/azkar/presentation/bloc/azkar_bloc.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/presentation/bloc/daleel_bloc.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:athar/app/features/dua/presentation/bloc/dua_bloc.dart';
import 'package:athar/app/features/settings/domain/settings_repository.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/flavors/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SettingsBloc(getIt.get<SettingsRepository>())),
            BlocProvider(create: (_) => DaleelBloc(getIt.get<DaleelRepository>())),
            BlocProvider(create: (_) => DuaBloc(getIt.get<DuaRepository>())),
            BlocProvider(create: (_) => AzkarBloc(getIt.get<AzkarRepository>())),
          ],
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              return MaterialApp.router(
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: settingsState.settings.themeMode,
                locale: Language.arabic.locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                debugShowCheckedModeBanner: appFlavor != Flavors.production.name,
                routerConfig: appRouter,
              );
            },
          ),
        );
      },
    );
  }
}
