import 'package:flutter/material.dart';

class HomeWidgetTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String placeholder;

  HomeWidgetTextField({this.textEditingController, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        counterText: '',
        hintText: placeholder ?? 'Chat with #noko',
        hintStyle: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 6.5,
          vertical: 2.0,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      autocorrect: false,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.start,
      maxLength: 144,
      maxLengthEnforced: true,
    );
  }
}
