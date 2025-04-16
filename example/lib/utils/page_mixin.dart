import 'package:flutter/material.dart';

mixin PageMixin on Widget {
  Future<void> push(BuildContext context) {
    return Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => this, fullscreenDialog: true));
  }
}
