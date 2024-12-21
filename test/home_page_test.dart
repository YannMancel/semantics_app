import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:semantics_app/home_page.dart';

import 'helper.dart';

void main() {
  testWidgets(
    'GIVEN the initial state, '
    'WHEN the page is displayed, '
    'THEN text and button are found.',
    (tester) async {
      await tester.myPumpWidget(
        widget: const HomePage(),
      );

      expect(find.text('Go to names page'), findsOneWidget);
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
      await tester.myPumpWidget(
        widget: const HomePage(),
      );

      expect(
        tester.getSemantics(find.text('Go to names page')).label,
        equals('Go to names page'),
      );
      expect(
        tester.getSemantics(find.byKey(const Key('button'))),
        matchesSemantics(
          identifier: 'home_go_to_names_page',
          label: 'button to go to names page',
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
