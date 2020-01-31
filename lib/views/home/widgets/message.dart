import 'package:flutter/material.dart';

class HomeWidgetMessage extends StatelessWidget {
  final String imageUrl, author, message;

  HomeWidgetMessage(this.imageUrl, this.author, this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 6.5,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 9,
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: '$author ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: message)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
