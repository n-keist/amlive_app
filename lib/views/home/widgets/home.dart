import 'package:amlive/styles/gradient.dart';
import 'package:amlive/views/home/widgets/feed_item.dart';
import 'package:amlive/views/home/widgets/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeWidgetHome extends StatefulWidget {
  @override
  _HomeWidgetHomeState createState() => _HomeWidgetHomeState();
}

class _HomeWidgetHomeState extends State<HomeWidgetHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'By Topic',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  HomeWidgetTopicCard(
                    icon: FeatherIcons.book,
                    text: 'Study',
                    gradient: TopicGradient.YELLOW,
                  ),
                  HomeWidgetTopicCard(
                    icon: FeatherIcons.map,
                    text: 'Travel',
                    gradient: TopicGradient.ORANGE,
                  ),
                  HomeWidgetTopicCard(
                    icon: FeatherIcons.user,
                    text: 'Chat',
                    gradient: TopicGradient.GREENBLUE,
                  ),
                  HomeWidgetTopicCard(
                    icon: FeatherIcons.shoppingBag,
                    text: 'Shopping',
                    gradient: TopicGradient.PURPLE,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Timeline',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: List.generate(12, (index) => HomeWidgetFeedItem()),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
