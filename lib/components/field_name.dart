import 'package:flutter/material.dart';

class FormFieldName extends StatelessWidget {
  String title;
  FormFieldName({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
