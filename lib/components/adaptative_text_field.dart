import 'dart:io';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Function(String)? onSubmitted;

  const AdaptativeTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyBoardType = TextInputType.text,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyBoardType,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyBoardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<TextEditingController>('controler', controller));
  }
}
