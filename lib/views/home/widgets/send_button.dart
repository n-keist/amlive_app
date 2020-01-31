import 'package:flutter/material.dart';

class HomeWidgetSendButton extends StatelessWidget {
  Function onPressed;

  HomeWidgetSendButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed ?? () => null,
      child: Text(
        'Send',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
