import 'package:flutter/material.dart';
import 'package:amlive/styles/gradient.dart';

class HomeWidgetTopicCard extends StatelessWidget {
  HomeWidgetTopicCard({
    this.gradient,
    this.text,
    this.icon,
    this.onTap,
  });

  final TopicGradient gradient;
  final String text;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: TopicGradientImp().gradients[gradient],
            begin: Alignment.topLeft,
            tileMode: TileMode.repeated,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        margin: const EdgeInsets.only(
          right: 4.0,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 16.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 4.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
