import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/misc/constants.dart';

class FlixTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  const FlixTextField({super.key, required this.labelText, required this.controller, this.obscureText = false});

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: ghostWhite),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ghostWhite)
        )
      ),
    );
  }
}