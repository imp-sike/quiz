import 'package:flutter/material.dart';

class ButtonColors {
  static const Color primary = Color(0xff2c59c0);
  static const Color danger = Color.fromARGB(255, 192, 59, 44);
}

Widget primaryButton({required onPressed, required title, Color color = ButtonColors.primary }) {
  return Container(
    padding: const EdgeInsets.only(top: 25),
    width: 400,
    height: 75,
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.blueGrey;
            }
            return color;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ))),
      onPressed: onPressed,
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
