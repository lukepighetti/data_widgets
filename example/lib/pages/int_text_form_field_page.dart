import 'package:example/utils/page_mixin.dart';
import 'package:example/views/example_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:data_widgets/data_widgets.dart';

class IntTextFormFieldPage extends StatefulWidget with PageMixin {
  const IntTextFormFieldPage({super.key});

  @override
  State<IntTextFormFieldPage> createState() => _IntTextFormFieldPageState();
}

class _IntTextFormFieldPageState extends State<IntTextFormFieldPage> {
  var data = 0;

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: "IntTextFormField",
      note: "Try opening the keyboard and tapping +",
      source: data.toString(),
      actions: [
        IconButton(
          icon: Icon(Icons.keyboard_hide),
          onPressed: () {
            primaryFocus?.unfocus();
          },
        ),
      ],
      body: IntTextFormField(
        source: data,
        autofocus: true,
        onChanged: (update) {
          setState(() => data = update);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => data++);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
