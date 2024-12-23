import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/english_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const name = 'signup';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(context.l10n.signUp.capitalized),
        actions: [
          IconButton(
            onPressed: () {
              context.settingsBloc.add(SettingsThemeChanged(
                context.settingsBloc.state.isThemeDark ? ThemeMode.light : ThemeMode.dark,
              ));
            },
            icon: const Icon(Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              // context.settingsBloc.switchLanguage
            },
            icon: const Icon(Icons.g_translate),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.icons.appLogo.path,
              height: 200.h,
            ),
            const Gap(10),
            Text(
              'اِنْضَمَّ الآنَ لِتَتْرُكَ أَثَرًا.ِ',
              style: context.textThemeX.large,
            ),
            const Gap(10),
            const _NameFormField(),
            const Gap(25),
            const _EmailField(),
            const Gap(25),
            const _PasswordField(),
            const Gap(25),
            const _ConfirmPasswordField(),
            const Gap(25),
            const _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _NameFormField extends StatelessWidget {
  const _NameFormField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignUpCubit, SignUpState, Name>(
      selector: (state) => state.name,
      builder: (context, name) {
        return TextFormField(
          key: const Key('signUpForm_nameInput_textField'),
          initialValue: name.value,
          textInputAction: TextInputAction.next,
          onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
          decoration: InputDecoration(
            label: Text(context.l10n.name.capitalizedDefinite),
            errorText: name.displayError == null ? null : context.l10n.invalidName,
          ),
        );
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: context.l10n.email.capitalized,
            errorText: state.email.displayError != null ? context.l10n.invalidEmail : null,
          ),
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) => context.read<SignUpCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: context.l10n.password.capitalized,
            errorText: state.password.displayError != null ? context.l10n.invalidPassword : null,
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordField extends StatelessWidget {
  const _ConfirmPasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) =>
              context.read<SignUpCubit>().confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          decoration: InputDecoration(
            labelText: context.l10n.confirmPassword.capitalized,
            errorText:
                state.confirmPassword.displayError != null ? context.l10n.passwordsDontMatch : null,
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isFailure) {
          context.scaffoldMessenger
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }
      },
      builder: (context, state) {
        return Button.filled(
          key: const Key('signUpForm_button'),
          maxWidth: true,
          shape: ButtonShape.roundedCorners,
          isLoading: state.status.isLoading,
          density: ButtonDensity.comfortable,
          onPressed: state.isValid ? () => context.read<SignUpCubit>().signUpFormSubmitted() : null,
          label: context.l10n.signUp.capitalized,
        );
      },
    );
  }
}
