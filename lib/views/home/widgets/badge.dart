import 'package:flutter/material.dart';

class HomeWidgetBadge extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final IconData icon;

  HomeWidgetBadge(this.backgroundColor, this.textColor, this.text, {this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(3.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.5,
          horizontal: 4.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (icon != null)
                ? Icon(
                    icon,
                    color: textColor,
                    size: 14.0,
                  )
                : Container(),
            (icon != null)
                ? SizedBox(
                    width: 2.0,
                  )
                : Container(),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
