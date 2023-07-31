import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const CustomFlatButton({super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 30,
          height: 1,
          color: Colors.blue,
        ),
      ),
      child: Text(label),
    );
  }
}
