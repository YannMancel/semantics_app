import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension L10NExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates {
    return AppLocalizations.localizationsDelegates;
  }

  Iterable<Locale> get supportedLocales {
    return AppLocalizations.supportedLocales;
  }
}
