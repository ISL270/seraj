import 'package:athar/app/core/extension_methods/getit_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/routing/router.dart';
import 'package:athar/app/core/theming/app_theme.dart';
import 'package:athar/app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:athar/app/features/settings/domain/settings_repository.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/flavors/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            BlocProvider(
              create: (context) => SettingsBloc(getIt.get<SettingsRepository>()),
            ),
            BlocProvider(create: (_) => getIt.authBloc),
          ],
          child: BlocBuilder<AuthBloc, UserState>(
            buildWhen: hasUserTypeChanged,
            builder: (context, authState) {
              return BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, settingsState) {
                  return MaterialApp.router(
                    theme: AppTheme.light,
                    darkTheme: AppTheme.dark,
                    themeMode: settingsState.themeMode,
                    // locale: settingsState.language.locale,
                    locale: Language.arabic.locale,
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates: AppLocalizations.localizationsDelegates,
                    debugShowCheckedModeBanner: appFlavor != Flavors.production.name,
                    routerConfig: appRouter,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
