import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:semantics_app/constants.dart';
import 'package:semantics_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Future<void> saveScreenshot(String title, List<int> bytes) async {
  //   final image = await File('screenshots/$title.png').create(recursive: true);
  //   image.writeAsBytesSync(bytes);
  // }

  // Future<void> takeScreenshot({required String title}) async {
  //   final bytes = await binding.takeScreenshot(title);
  //   await saveScreenshot(title, bytes);
  // }

  group('end-to-end test', () {
    testWidgets(
      'GIVEN the initial state, '
      'WHEN we navigate in the application, '
      'THEN UI is found.',
      (tester) async {
        await tester.pumpWidget(const MyApp());

        // if (Platform.isAndroid) {
        //   await binding.convertFlutterSurfaceToImage();
        //   await tester.pumpAndSettle();
        // }

        expect(find.text('Go to names page'), findsOneWidget);
        final homeButton = find.descendant(
          of: find.byType(FloatingActionButton),
          matching: find.byIcon(Icons.arrow_forward),
        );
        expect(homeButton, findsOneWidget);

        //await takeScreenshot(title: 'screenshot-home-page');

        await tester.tap(homeButton);
        await tester.pumpAndSettle();

        expect(find.byType(ListTile), findsNWidgets(kNames.length));

        //await takeScreenshot(title: 'screenshot-names-page');

        final backButton = find.byType(BackButton);
        await tester.tap(backButton);
        await tester.pumpAndSettle();
      },
    );
  });
}
