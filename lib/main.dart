import 'package:flutter/material.dart';
import 'package:semantics_app/core/constants.dart';
import 'package:semantics_app/core/l10n/l10n_extension.dart';
import 'package:semantics_app/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationsDelegates,
      supportedLocales: context.supportedLocales,
      home: const HomePage(),
    );
  }
}
