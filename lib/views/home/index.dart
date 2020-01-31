import 'dart:io';

import 'package:amlive/views/home/widgets/badge.dart';
import 'package:amlive/views/home/widgets/message.dart';
import 'package:amlive/views/home/widgets/send_button.dart';
import 'package:amlive/views/home/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeViewIndex extends StatefulWidget {
  @override
  _HomeViewIndexState createState() => _HomeViewIndexState();
}

class _HomeViewIndexState extends State<HomeViewIndex>
    with SingleTickerProviderStateMixin {
  PanelController _panelController = new PanelController();
  PageController _pageController = new PageController();
  AnimationController _animationController;

  Widget _chat = Container();
  Widget _stream = Container();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      value: 0,
    );

    setState(() {
      _chat = Center(
        child: Platform.isIOS
            ? CupertinoActivityIndicator()
            : SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                ),
              ),
      );
      _stream = Center(
        child: Platform.isIOS
            ? CupertinoActivityIndicator()
            : SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                ),
              ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('amlive'),
        centerTitle: true,
      ),
      body: SlidingUpPanel(
        controller: _panelController,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        color: ThemeData.light().scaffoldBackgroundColor,
        defaultPanelState: PanelState.CLOSED,
        minHeight: MediaQuery.of(context).size.height * 0.39,
        maxHeight: MediaQuery.of(context).size.height * 0.77,
        isDraggable: true,
        panelSnapping: true,
        parallaxEnabled: true,
        animationDuration: 200,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        onPanelSlide: _onPanelSlide,
        panel: _panel(),
        body: _body(),
      ),
    );
  }

  Widget _panel() {
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
              child: Text(
                '#noko',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
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
                  ).animate(_animationController),
                  child: Icon(Icons.arrow_upward),
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
                icon: Icons.remove_red_eye,
              ),
              HomeWidgetBadge(
                Colors.blue[100],
                Colors.blue,
                '12.3k',
                icon: Icons.person,
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

  Widget _body() {
    return PageView.builder(
      itemCount: 2,
      controller: _pageController,
      itemBuilder: (buildContext, index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://loremflickr.com/480/400/cat',
              ),
              alignment: Alignment.topCenter,
            ),
          ),
        );
      },
    );
  }

  void _onPanelSlide(double value) {
    double max = 0.5;
    _animationController.value = value / max;
  }

  void _togglePanel() {
    if (_panelController.isAttached) {
      if (_panelController.isPanelClosed) {
        _panelController.animatePanelToPosition(1.0);
        _animationController.forward();
      } else {
        _panelController.animatePanelToPosition(0.0);
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
    _animationController?.dispose();
  }
}
