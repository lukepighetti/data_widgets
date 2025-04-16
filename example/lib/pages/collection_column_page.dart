import 'package:example/data_models.dart';
import 'package:example/utils/extensions.dart';
import 'package:example/utils/page_mixin.dart';
import 'package:flutter/material.dart';
import 'package:data_widgets/data_widgets.dart';

class CollectionColumnPage extends StatefulWidget with PageMixin {
  const CollectionColumnPage({super.key});

  @override
  State<CollectionColumnPage> createState() => _CollectionColumnPageState();
}

class _CollectionColumnPageState extends State<CollectionColumnPage> {
  var data = [
    Group(
      title: "Group A",
      items: [GroupItem(title: "Item 1"), GroupItem(title: "Item 2")],
    ),
    Group(title: "Group B", items: [GroupItem(title: "Item 3")]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CollectionColumn")),
      body: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            CollectionColumn(
              source: data,
              onChange: (update) {
                setState(() => data = update);
              },
              builder: (_, g) {
                return Container(
                  constraints: BoxConstraints(minHeight: 80),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(title: Text(g.title)),
                        CollectionColumn(
                          source: g.items,
                          onChange: (update) {
                            setState(() {
                              data = data.replacedWhere(
                                (e) => e == g,
                                g.copyWith(items: update),
                              );
                            });
                          },
                          builder: (_, y) {
                            return ListTile(title: Text(y.title));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Text("Try reordering groups and items"),
            // TODO: allow moving items from one group to another. might need a [GroupedCollectionColumn]
            Text("// TODO: support moving items between groups"),
          ],
        ),
      ),
    );
  }
}
