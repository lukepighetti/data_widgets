import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntTextFormField extends StatelessWidget {
  const IntTextFormField({
    super.key,
    this.initialValue,
    this.autofocus = false,
    this.focusNode,
    required this.onChange,
  });

  // TODO: min/max
  final bool autofocus;
  final FocusNode? focusNode;
  final int? initialValue;
  final ValueChanged<int?> onChange;

  @override
  Widget build(BuildContext context) {
    return TypedTextFormField<int>(
      autofocus: autofocus,
      focusNode: focusNode,
      initialValue: initialValue,
      onChanged: onChange,
      spec: TypedTextFormFieldSpec(
        serialize: (x) => x.toString(),
        deserialize: (x) => int.tryParse(x),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        keyboardType: TextInputType.numberWithOptions(decimal: false),
      ),
    );
  }
}

class DoubleTextFormField extends StatelessWidget {
  const DoubleTextFormField({
    super.key,
    this.initialValue,
    required this.onChange,
    this.autofocus = false,
    this.focusNode,
  });

  // TODO: min, max
  final double? initialValue;
  final ValueChanged<double?> onChange;
  final bool autofocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TypedTextFormField<double>(
      autofocus: autofocus,
      focusNode: focusNode,
      initialValue: initialValue,
      onChanged: onChange,
      spec: TypedTextFormFieldSpec(
        serialize: (x) => x.toString(),
        deserialize: (x) => double.tryParse(x),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}

// TODO: EmailTextFormField
// TODO: PasswordTextFormField

class TypedTextFormField<T> extends StatelessWidget {
  const TypedTextFormField({
    super.key,
    required this.spec,
    required this.autofocus,
    this.focusNode,
    this.initialValue,
    required this.onChanged,
  });

  final T? initialValue;
  final TypedTextFormFieldSpec<T> spec;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      focusNode: focusNode,
      autocorrect: false,
      initialValue: spec.serialize(initialValue),
      inputFormatters: spec.inputFormatters,
      decoration: InputDecoration(hintText: initialValue?.toString()),
      onChanged: (x) {
        onChanged(spec.deserialize(x));
      },
      keyboardType: spec.keyboardType,
    );
  }
}

class TypedTextFormFieldSpec<T> {
  final String Function(T?) serialize;
  final T? Function(String) deserialize;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;

  TypedTextFormFieldSpec({
    required this.serialize,
    required this.deserialize,
    required this.inputFormatters,
    required this.keyboardType,
  });
}
