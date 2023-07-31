import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomFlatButton({super.key,
    required this.label,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {

    const defaultTextStyle = TextStyle(
      fontFamily: 'Raleway',
      height: 1,
      color: Colors.blue,
    );

    final modifiedTextStyle = defaultTextStyle.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: modifiedTextStyle,
      ),
      child: Text(label),
    );
  }
}
