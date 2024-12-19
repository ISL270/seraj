import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/english_x.dart';
import 'package:athar/app/core/extension_methods/getit_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const name = 'settings';

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settings) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.theme.capitalized,
                      style: context.textThemeX.large.bold,
                    ),
                    SegmentedButton(
                      showSelectedIcon: false,
                      selected: {settings.themeMode},
                      onSelectionChanged: (selection) {
                        context.read<SettingsBloc>().add(SettingsThemeChanged(selection.first));
                      },
                      segments: [
                        ButtonSegment(
                          value: ThemeMode.light,
                          label: Text(context.l10n.light.capitalized),
                        ),
                        ButtonSegment(
                          value: ThemeMode.dark,
                          label: Text(context.l10n.dark.capitalized),
                        ),
                        ButtonSegment(
                          value: ThemeMode.system,
                          label: Text(context.l10n.system.capitalized),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.language.capitalized,
                      style: context.textThemeX.large.bold,
                    ),
                    SegmentedButton(
                      showSelectedIcon: false,
                      selected: {settings.language},
                      onSelectionChanged: (selection) {
                        context.settingsBloc.add(SettingsLanguageChanged(selection.first));
                      },
                      segments: [
                        ButtonSegment(
                          value: Language.arabic,
                          label: Text(Language.arabic.name),
                        ),
                        ButtonSegment(
                          value: Language.english,
                          label: Text(Language.english.name),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Button.outlined(
                  maxWidth: true,
                  density: ButtonDensity.comfortable,
                  onPressed: () => getIt.authBloc.add(AuthLogoutRequested()),
                  label: context.l10n.logout.capitalized,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
