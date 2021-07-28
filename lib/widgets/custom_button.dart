import 'package:flutter/material.dart';

/// Widget [CustomButton] : CustomButton for creating custom button
class CustomButton extends StatelessWidget {
  //Variable
  final Function() onTap;
  final String title;
  final Color color, fontColor;

  CustomButton({
    required this.onTap,
    required this.title,
    required this.color,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          elevation: MaterialStateProperty.all(6),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 13,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
