import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:semantics_app/pages/home_page.dart';

import 'helper.dart';

void main() {
  testWidgets(
    'GIVEN the initial state, '
    'WHEN the page is displayed, '
    'THEN text and button are found.',
    (tester) async {
      final (:navigatorObserver, :l10n) = await tester.myPumpWidget(
        widget: const HomePage(),
      );

      expect(find.text(l10n.goToNamesPage), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(FloatingActionButton),
          matching: find.byIcon(Icons.arrow_forward),
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'GIVEN the initial state, '
    'WHEN the page is displayed, '
    'THEN semantics are found.',
    (tester) async {
      final handler = tester.ensureSemantics();
      final (:navigatorObserver, :l10n) = await tester.myPumpWidget(
        widget: const HomePage(),
      );

      expect(
        tester.getSemantics(find.text(l10n.goToNamesPage)).label,
        equals(l10n.goToNamesPage),
      );
      expect(
        tester.getSemantics(find.byKey(const Key('button'))),
        matchesSemantics(
          identifier: 'home_go_to_names_page',
          label: l10n.homeButtonSemantics,
          isEnabled: true,
          hasEnabledState: true,
          isButton: true,
          hasTapAction: true,
        ),
      );
      await expectLater(tester, meetsGuideline(textContrastGuideline));
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      handler.dispose();
    },
  );
}
