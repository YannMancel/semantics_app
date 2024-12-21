import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:semantics_app/constants.dart';

class NamesPage extends StatelessWidget {
  const NamesPage({super.key});

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
            label: 'This page displays a list of items. '
                'Each item has a name and a button. '
                'The button is located to the right of the item.',
          ),
          child: Text('Names Page'),
        ),
      ),
      body: ListView.builder(
        addSemanticIndexes: false,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        itemCount: kNames.length,
        itemBuilder: (_, index) {
          final isEnable = (index != 0);
          final name = kNames[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Semantics.fromProperties(
              key: Key('${index}_list_tile'),
              properties: SemanticsProperties(
                identifier: 'names_${index}_list_tile',
                label: 'list tile of $name',
              ),
              child: ListTile(
                title: ExcludeSemantics(
                  child: Text(name),
                ),
                trailing: Semantics.fromProperties(
                  key: Key('${index}_icon_button'),
                  excludeSemantics: true,
                  properties: SemanticsProperties(
                    identifier: 'names_${index}_open_more_popup',
                    label: 'button of $name to open more popup',
                    enabled: isEnable,
                    button: true,
                    onTap: isEnable ? () {} : null,
                  ),
                  child: IconButton(
                    onPressed: isEnable ? () {} : null,
                    icon: const Icon(Icons.more_vert),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
