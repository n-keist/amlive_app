import 'dart:ui';

import 'package:flutter/material.dart';

class HomeWidgetFeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.42,
                height: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage('https://loremflickr.com/320/240'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '#noko',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' is chatting',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
