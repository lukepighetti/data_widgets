import 'package:flutter/material.dart';

class DismissKeyboardIconButton extends StatelessWidget {
  const DismissKeyboardIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.viewInsetsOf(context).bottom == 0) return SizedBox();

    return IconButton(
      icon: Icon(Icons.keyboard_hide),
      onPressed: () {
        primaryFocus?.unfocus();
      },
    );
  }
}
