import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {

  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  String? labelText;

  CustomField({this.labelText,this.validator,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
