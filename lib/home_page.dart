import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:semantics_app/names_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Semantics.fromProperties(
          excludeSemantics: true,
          properties: SemanticsProperties(
            header: true,
            sortKey: OrdinalSortKey(0),
            label: 'This page displays a text in the centre '
                'and a button in the bottom right-hand corner.',
          ),
          child: Text('Home Page'),
        ),
      ),
      body: const Center(
        child: Text('Go to names page'),
      ),
      floatingActionButton: Semantics.fromProperties(
        key: const Key('button'),
        excludeSemantics: true,
        properties: SemanticsProperties(
          identifier: 'home_go_to_names_page',
          label: 'button to go to names page',
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
