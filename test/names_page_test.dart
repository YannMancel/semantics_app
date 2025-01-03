import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:semantics_app/core/constants.dart';
import 'package:semantics_app/pages/names_page.dart';

import 'helper.dart';

void main() {
  testWidgets(
    'GIVEN the initial state, '
    'WHEN the page is displayed, '
    'THEN N ListTiles are found.',
    (tester) async {
      await tester.myPumpWidget(
        widget: const NamesPage(),
      );

      expect(find.byType(ListTile), findsNWidgets(kNames.length));
    },
  );

  testWidgets(
    'GIVEN the initial state, '
    'WHEN the page is displayed, '
    'THEN semantics are found.',
    (tester) async {
      final handler = tester.ensureSemantics();
      final (:navigatorObserver, :l10n) = await tester.myPumpWidget(
        widget: const NamesPage(),
      );

      for (int i = 0; i < kNames.length; i++) {
        expect(
          tester.getSemantics(find.byKey(Key('${i}_list_tile'))),
          matchesSemantics(
            identifier: 'names_${i}_list_tile',
            label: l10n.namesListTileSemantics(kNames[i]),
            isEnabled: true,
            hasEnabledState: true,
          ),
        );
        final isEnable = (i != 0);
        expect(
          tester.getSemantics(find.byKey(Key('${i}_icon_button'))),
          matchesSemantics(
            identifier: 'names_${i}_open_more_popup',
            label: l10n.namesButtonSemantics(kNames[i]),
            isEnabled: isEnable,
            hasEnabledState: true,
            isButton: true,
            hasTapAction: isEnable,
          ),
        );
      }
      await expectLater(tester, meetsGuideline(textContrastGuideline));
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      handler.dispose();
    },
  );
}
