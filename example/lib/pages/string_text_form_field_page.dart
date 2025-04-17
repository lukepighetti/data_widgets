import 'package:example/utils/page_mixin.dart';
import 'package:example/views/example_scaffold.dart';
import 'package:example/widgets/dismiss_keyboard_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:data_widgets/data_widgets.dart';

class StringTextFormFieldPage extends StatefulWidget with PageMixin {
  const StringTextFormFieldPage({super.key});

  @override
  State<StringTextFormFieldPage> createState() =>
      _StringTextFormFieldPageState();
}

class _StringTextFormFieldPageState extends State<StringTextFormFieldPage> {
  var data = '';

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: "StringTextFormField",
      note: "Try opening the keyboard and tapping +",
      source: data.toString(),
      actions: [DismissKeyboardIconButton()],
      body: StringTextFormField(
        source: data,
        autofocus: true,
        onChanged: (update) {
          setState(() => data = update);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => data += 'FAB');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
