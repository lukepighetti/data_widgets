import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntTextFormField extends StatelessWidget {
  const IntTextFormField({
    super.key,
    required this.source,
    required this.onChanged,
    this.autofocus = false,
    this.focusNode,
    this.decoration,
  });

  // TODO: min/max
  final bool autofocus;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final int source;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return TypedTextFormField<int>(
      source: source,
      onChanged: onChanged,
      autofocus: autofocus,
      focusNode: focusNode,
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
    required this.source,
    required this.onChanged,
    this.autofocus = false,
    this.focusNode,
    this.decoration,
  });

  // TODO: min, max
  final double source;
  final ValueChanged<double> onChanged;
  final bool autofocus;
  final FocusNode? focusNode;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TypedTextFormField<double>(
      source: source,
      onChanged: onChanged,
      autofocus: autofocus,
      focusNode: focusNode,
      spec: TypedTextFormFieldSpec(
        serialize: (x) => x.toString(),
        deserialize: (x) => double.tryParse(x),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}

class StringTextFormField extends StatelessWidget {
  const StringTextFormField({
    super.key,
    required this.source,
    required this.onChanged,
    this.autofocus = false,
    this.focusNode,
    this.decoration,
    this.inputFormatters = const [],
    this.keyboardType,
  });

  final bool autofocus;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final String source;
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TypedTextFormField<String>(
      source: source,
      onChanged: onChanged,
      autofocus: autofocus,
      focusNode: focusNode,
      spec: TypedTextFormFieldSpec(
        serialize: (x) => x,
        deserialize: (x) => x,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
      ),
    );
  }
}

// TODO: EmailTextFormField
// TODO: PasswordTextFormField
// TODO: use placeholder for source until user has edited the value

class TypedTextFormField<T> extends StatefulWidget {
  const TypedTextFormField({
    super.key,
    required this.source,
    required this.onChanged,
    required this.spec,
    this.autofocus = false,
    this.focusNode,
    this.decoration,
  });

  final T source;
  final ValueChanged<T> onChanged;
  final TypedTextFormFieldSpec<T> spec;
  final bool autofocus;
  final FocusNode? focusNode;
  final InputDecoration? decoration;

  String get _value => spec.serialize(source);

  @override
  State<TypedTextFormField<T>> createState() => _TypedTextFormFieldState<T>();
}

class _TypedTextFormFieldState<T> extends State<TypedTextFormField<T>> {
  late final controller = TextEditingController(text: widget._value);

  @override
  void didUpdateWidget(covariant TypedTextFormField<T> oldWidget) {
    if (oldWidget._value != widget._value) {
      controller.text = widget._value;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (x) {
        final newValue = widget.spec.deserialize(x);
        if (newValue != null) widget.onChanged(newValue);
      },
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      autocorrect: false,
      inputFormatters: widget.spec.inputFormatters,
      decoration: widget.decoration,
      keyboardType: widget.spec.keyboardType,
    );
  }
}

class TypedTextFormFieldSpec<T> {
  final String Function(T) serialize;
  final T? Function(String) deserialize;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType? keyboardType;

  TypedTextFormFieldSpec({
    required this.serialize,
    required this.deserialize,
    required this.inputFormatters,
    required this.keyboardType,
  });
}
