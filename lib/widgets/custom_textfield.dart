import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const CustomTextfield({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 440,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        autofocus: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
