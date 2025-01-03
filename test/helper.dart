import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_app/core/l10n/l10n_extension.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

typedef TestConfiguration = ({
  MockNavigatorObserver navigatorObserver,
  AppLocalizations l10n,
});

extension WidgetTesterExt on WidgetTester {
  Future<TestConfiguration> myPumpWidget({
    required Widget widget,
  }) async {
    final observer = MockNavigatorObserver();
    late AppLocalizations translations;
    await pumpWidget(
      MaterialApp(
        title: 'Semantics App',
        navigatorObservers: <NavigatorObserver>[observer],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            translations = context.l10n;
            return widget;
          },
        ),
      ),
    );

    await pumpAndSettle();

    return (
      navigatorObserver: observer,
      l10n: translations,
    );
  }
}
