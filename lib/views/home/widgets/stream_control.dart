import 'package:flutter/material.dart';

class HomeWidgetStreamControl extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;

  HomeWidgetStreamControl({this.icon, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 5.0,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            )
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
