import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

typedef TestConfiguration = ({MockNavigatorObserver navigatorObserver});

extension WidgetTesterExt on WidgetTester {
  Future<TestConfiguration> myPumpWidget({
    required Widget widget,
  }) async {
    final observer = MockNavigatorObserver();
    await pumpWidget(
      MaterialApp(
        title: 'Semantics App',
        navigatorObservers: <NavigatorObserver>[observer],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: widget,
      ),
    );
    return (navigatorObserver: observer);
  }
}
