import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:semantics_app/core/l10n/l10n_extension.dart';
import 'package:semantics_app/pages/names_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _onPressed(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const NamesPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Semantics.fromProperties(
          excludeSemantics: true,
          properties: SemanticsProperties(
            header: true,
            sortKey: const OrdinalSortKey(0),
            label: l10n.homePageSemantics,
          ),
          child: Text(l10n.homePage),
        ),
      ),
      body: Center(
        child: Text(l10n.goToNamesPage),
      ),
      floatingActionButton: Semantics.fromProperties(
        key: const Key('button'),
        excludeSemantics: true,
        properties: SemanticsProperties(
          identifier: 'home_go_to_names_page',
          label: l10n.homeButtonSemantics,
          enabled: true,
          button: true,
          onTap: () => _onPressed(context),
        ),
        child: FloatingActionButton(
          onPressed: () => _onPressed(context),
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
