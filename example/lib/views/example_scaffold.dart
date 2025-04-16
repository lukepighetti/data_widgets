import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

class ExampleScaffold extends StatelessWidget {
  const ExampleScaffold({
    super.key,
    this.note,
    this.todo,
    this.source,
    this.jsonSource,
    this.actions = const [],
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  final String title;
  final List<Widget> actions;
  final String? source;
  final Object? jsonSource;
  final String? note;
  final String? todo;
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final (source, note, todo) = (this.source, this.note, this.todo);

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                body,
                Divider(),
                if (jsonSource != null) JsonView.string(jsonEncode(jsonSource)),
                if (source != null) Text("source: $source"),
                if (note != null) Text(note),
                if (todo != null) Text("// TODO: $todo"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
