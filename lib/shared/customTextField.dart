import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;

  // ignore: use_key_in_widget_constructors
  const CustomTextField(
      {required this.controller, required this.hintText, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration:  InputDecoration(
        border: const OutlineInputBorder(),
        labelText: hintText,
      ),
    );
  }
}
