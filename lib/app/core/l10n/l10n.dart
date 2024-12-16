import 'package:athar/app/core/extension_methods/getit_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => getIt.l10nSvc.l10n(this);

  String tr(String trKey) => getIt.l10nSvc.trFromStr(trKey, this);
}
