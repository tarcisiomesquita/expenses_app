import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final void Function(String)? onSubmitted;

  const AdaptativeTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              placeholder: label,
              textInputAction: textInputAction,
              onSubmitted: onSubmitted,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(labelText: label),
            textInputAction: textInputAction,
            onSubmitted: onSubmitted,
          );
  }
}
