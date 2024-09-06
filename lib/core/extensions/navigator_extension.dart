import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void pop() {
    Navigator.of(this).pop();
  }

  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }
}
