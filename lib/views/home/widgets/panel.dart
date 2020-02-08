import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'badge.dart';
import 'message.dart';
import 'send_button.dart';
import 'textfield.dart';

class HomeWidgetPanel extends StatefulWidget {
  final AnimationController animationController;
  final PanelController panelController;
  final ScrollController scrollController;

  HomeWidgetPanel(
      {this.animationController, this.panelController, this.scrollController});

  @override
  _HomeWidgetPanelState createState() => _HomeWidgetPanelState();
}

class _HomeWidgetPanelState extends State<HomeWidgetPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(text: '#noko'),
                    TextSpan(
                      text: ' is chatting',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: RotationTransition(
                  turns: Tween(
                    begin: 0.0,
                    end: 0.5,
                  ).animate(widget.animationController),
                  child: Icon(FeatherIcons.arrowUp),
                ),
                onPressed: _togglePanel,
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: Offset(0, -10),
          child: Wrap(
            spacing: 4.0,
            children: <Widget>[
              HomeWidgetBadge(
                Colors.green[100],
                Colors.green,
                '2.3k',
                icon: FeatherIcons.eye,
              ),
              HomeWidgetBadge(
                Colors.blue[100],
                Colors.blue,
                '12.3k',
                icon: FeatherIcons.user,
              ),
            ],
          ),
        ),
        Container(
          height: 35.0,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: HomeWidgetTextField(),
              ),
              Expanded(
                flex: 2,
                child: HomeWidgetSendButton(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            controller: widget.scrollController,
            itemCount: 20,
            reverse: false,
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            itemBuilder: (buildContext, index) {
              return HomeWidgetMessage(
                'https://loremflickr.com/100/100/cat',
                'k3vin$index',
                'brudi nicer stream ',
              );
            },
          ),
        ),
      ],
    );
  }

  void _togglePanel() {
    if (widget.panelController.isAttached) {
      if (widget.panelController.isPanelClosed) {
        widget.panelController.animatePanelToPosition(1.0);
        widget.animationController.forward();
      } else {
        widget.panelController.animatePanelToPosition(0.0);
        widget.animationController.reverse();
      }
    }
  }
}
