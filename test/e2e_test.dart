import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:semantics_app/core/constants.dart';
import 'package:semantics_app/pages/home_page.dart';

import 'helper.dart';

void main() {
  setUpAll(() {
    final fakeRouteToHelpMocktailWithItsAny = MaterialPageRoute(
      builder: (_) => const Text('Fake UI never used'),
    );
    registerFallbackValue(fakeRouteToHelpMocktailWithItsAny);
  });

  testWidgets(
    'GIVEN the initial state, '
    'WHEN we navigate in the application, '
    'THEN UI is found.',
    (tester) async {
      final (:navigatorObserver, :l10n) = await tester.myPumpWidget(
        widget: const HomePage(),
      );

      verify(
        () => navigatorObserver.didPush(
          any(that: isA<Route<dynamic>>()),
          any(that: isA<Route<dynamic>?>()),
        ),
      ).called(1);

      expect(find.text(l10n.goToNamesPage), findsOneWidget);
      final homeButton = find.descendant(
        of: find.byType(FloatingActionButton),
        matching: find.byIcon(Icons.arrow_forward),
      );
      expect(homeButton, findsOneWidget);

      await tester.tap(homeButton);
      await tester.pumpAndSettle();

      verify(
        () => navigatorObserver.didPush(
          any(that: isA<Route<dynamic>>()),
          any(that: isA<Route<dynamic>?>()),
        ),
      ).called(1);

      expect(find.byType(ListTile), findsNWidgets(kNames.length));

      final backButton = find.byType(BackButton);
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      verify(
        () => navigatorObserver.didPop(
          any(that: isA<Route<dynamic>>()),
          any(that: isA<Route<dynamic>?>()),
        ),
      ).called(1);
    },
  );
}
