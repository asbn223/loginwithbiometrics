import 'package:flutter/material.dart';

/// Widget [CustomTextField] : CustomTextField for creating custom button
class CustomTextField extends StatefulWidget {
  //Variables
  final String labelText, value;
  bool isPassword, isInitialValue, isPasswordSeen;
  final IconData prefixIcon;
  final String Function(String?) onSaved;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color textColor, borderColor;

  CustomTextField({
    required this.labelText,
    required this.value,
    required this.prefixIcon,
    required this.onSaved,
    required this.textInputAction,
    required this.textInputType,
    this.isPassword = false,
    this.isPasswordSeen = false,
    this.isInitialValue = false,
    this.borderColor = Colors.blueAccent,
    this.textColor = Colors.blueAccent,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: widget.textColor,
      onChanged: widget.onSaved,
      textInputAction: widget.textInputAction,
      style: TextStyle(
        color: widget.textColor,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: widget.textColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: widget.textColor,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.isPasswordSeen
                      ? Icons.remove_red_eye
                      : Icons.visibility_off,
                  color: widget.textColor,
                ),
                onPressed: () {
                  setState(() {
                    widget.isPasswordSeen = !widget.isPasswordSeen;
                  });
                },
              )
            : null,
        labelText: widget.labelText,
      ),
      obscureText: widget.isPasswordSeen,
      keyboardType: widget.textInputType,
      enableSuggestions: true,
    );
  }
}
