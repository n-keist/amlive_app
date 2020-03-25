import 'package:flutter/material.dart';

class HomeWidgetStreamControl extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  HomeWidgetStreamControl(this.child, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 3.0,
        ),
        child: child,
      ),
      onTap: onPressed,
    );
  }
}
