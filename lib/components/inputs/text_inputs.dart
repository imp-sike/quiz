import 'package:flutter/material.dart';

Container globalTextFormField(
    {required TextEditingController controller,
    required validator,
    required String hintText,
    required String labelText,
    required IconData iconData,
    double width = 400,
    TextInputType textInputType = TextInputType.text,
    bool obscureText = false}) {
  return Container(
    padding: const EdgeInsets.only(top: 25),
    width: width,
    child: TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(iconData),
        contentPadding: const EdgeInsets.all(25),
      ),
    ),
  );
}
