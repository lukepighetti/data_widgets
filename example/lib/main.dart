import 'package:example/pages/collection_column_page.dart';
import 'package:example/pages/int_text_form_field_page.dart';
import 'package:example/pages/string_text_form_field_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text("data_widgets")),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                    child: Text("CollectionColumn"),
                    onPressed: () => CollectionColumnPage().push(context),
                  ),
                  FilledButton(
                    child: Text("IntTextFormField"),
                    onPressed: () => IntTextFormFieldPage().push(context),
                  ),
                  FilledButton(
                    child: Text("StringTextFormField"),
                    onPressed: () => StringTextFormFieldPage().push(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
