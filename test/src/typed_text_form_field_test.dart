import 'package:data_widgets/data_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TypedTextFormField', () {
    final ValueNotifier<String> source = ValueNotifier('');

    Widget buildForString() {
      return MaterialApp(
        home: Scaffold(
          body: ListenableBuilder(
            listenable: source,
            builder:
                (context, _) => TypedTextFormField(
                  source: source.value,
                  onChanged: (value) {
                    source.value = value;
                  },
                  spec: TypedTextFormFieldSpec<String>(
                    serialize: (x) => x ?? '',
                    deserialize: (x) => x,
                    inputFormatters: [],
                    keyboardType: TextInputType.text,
                  ),
                ),
          ),
        ),
      );
    }

    testWidgets('should show the text', (tester) async {
      await tester.pumpWidget(buildForString());
      await tester.enterText(find.byType(TextField), 'test');
      expect(source.value, equals('test'));
    });

    testWidgets('can edit from other cursor positions', (tester) async {
      await tester.pumpWidget(buildForString());

      final controller =
          tester.widget<TextField>(find.byType(TextField)).controller!;

      await tester.showKeyboard(find.byType(TextField));

      // Simulate a user adding foo to bar from the beginning
      tester.testTextInput.updateEditingValue(
        controller.value.copyWith(
          text: 'foobar',
          selection: TextSelection.collapsed(offset: 3),
        ),
      );

      await tester.pump();

      expect(controller.text, equals('foobar'));
      expect(controller.selection.start, equals(3));
      expect(controller.selection.end, equals(3));
      expect(source.value, equals('foobar'));
    });
    testWidgets('cannot enter invalid composing range', (tester) async {
      await tester.pumpWidget(buildForString());

      await tester.showKeyboard(find.byType(TextField));

      // Enter text to create an invalid composing range
      tester.testTextInput.updateEditingValue(
        const TextEditingValue(
          text: 'foobar',
          selection: TextSelection.collapsed(offset: 2),
          composing: TextRange(start: 1, end: 2),
        ),
      );

      await tester.pump();

      // verify that the composing range on the text field is valid
      final backingTextField = tester.widget<TextField>(find.byType(TextField));
      final controller = backingTextField.controller!;
      expect(controller.value.composing.start, 1);
      expect(controller.value.composing.end, 2);

      // Set the new value externally (not by user)
      source.value = '';
      await tester.pump();

      // Verify that the composing range is cleared
      expect(controller.value.composing, TextRange.empty);

      expect(find.byType(TextField), findsOneWidget);
    });
  });
}
